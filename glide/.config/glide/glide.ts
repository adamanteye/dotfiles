// Restore menu access preferences persisted by the previous config.
glide.prefs.clear("ui.key.menuAccessKeyFocuses");
glide.prefs.clear("ui.key.menuAccessKey");

glide.keymaps.set("normal", "<C-d>", "tab_close");

// tmux prefix; keep Space and the default page bindings.
if (glide.keymaps.list("normal").some((map) => map.lhs === "<C-b>")) {
  glide.keymaps.del("normal", "<C-b>");
}

for (const [key, command] of Object.entries({
  c: "tab_new",
  n: "tab_next",
  p: "tab_prev",
  j: "tab_next",
  k: "tab_prev",
  x: "tab_close",
  r: "config_reload",
} as const)) {
  glide.keymaps.set("normal", `<C-b>${key}`, command);
}

glide.keymaps.set("normal", "<C-b>l", () => glide.keys.send("<C-l>", { skip_mappings: true }), {
  description: "Focus address bar",
});

declare global {
  interface GlideModes { copy: "copy"; "copy-search": "copy-search"; }
}
glide.modes.register("copy", { caret: "line", switch_mode_on_focus: false });
glide.modes.register("copy-search", { caret: "line", switch_mode_on_focus: false });
let selecting = false;
let previousCaret = false;
glide.keymaps.set("normal", "<C-b>[", async () => {
  selecting = false;
  previousCaret = glide.prefs.get("accessibility.browsewithcaret") as boolean;
  glide.prefs.set("accessibility.browsewithcaret", true);
  await glide.excmds.execute("mode_change copy");
  await glide.content.execute(() => {
    const selection = window.getSelection();
    if (!selection || selection.rangeCount) return;
    const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT);
    while (walker.nextNode()) {
      if (!walker.currentNode.textContent?.trim()) continue;
      const range = document.createRange();
      range.selectNodeContents(walker.currentNode);
      const rect = range.getBoundingClientRect();
      if (!rect.width || rect.bottom <= 0 || rect.top >= innerHeight) continue;
      range.collapse(true);
      selection.addRange(range);
      break;
    }
  }, { tab_id: await glide.tabs.active() });
}, { description: "Enter copy mode" });
glide.autocmds.create("ModeChanged", "*", ({ old_mode, new_mode }) => {
  if (!old_mode?.startsWith("copy") || new_mode.startsWith("copy")) return;
  glide.prefs.set("accessibility.browsewithcaret", previousCaret);
  selecting = false;
});
for (const [key, arrow] of Object.entries({ h: "Left", j: "Down", k: "Up", l: "Right" })) {
  glide.keymaps.set("copy", key, () =>
    glide.keys.send(`<${selecting ? "S-" : ""}${arrow}>`, { skip_mappings: true }));
}
async function clearCopySelection() {
  selecting = false;
  await glide.content.execute(() => {
    const selection = window.getSelection();
    if (selection?.rangeCount) selection.collapseToEnd();
  }, { tab_id: await glide.tabs.active() });
}
glide.keymaps.set("copy", "v", async () => {
  await clearCopySelection();
  selecting = true;
});
glide.keymaps.set("copy", "/", async () => {
  selecting = false;
  await glide.excmds.execute("mode_change copy-search");
  await glide.findbar.open({ query: "", mode: "normal" });
});
for (const key of ["<Enter>", "<Esc>"]) {
  glide.keymaps.set("copy-search", key, async () => {
    await glide.findbar.close();
    await glide.excmds.execute("mode_change copy");
  });
}
glide.keymaps.set("copy", "y", () => glide.keys.send("<C-c>", { skip_mappings: true }));
glide.keymaps.set("copy", "<Enter>", async () => {
  await glide.keys.send("<C-c>", { skip_mappings: true });
  await clearCopySelection();
  await glide.excmds.execute("mode_change normal");
});
for (const key of ["<Esc>", "<C-[>"]) {
  glide.keymaps.set("copy", key, clearCopySelection);
}
for (const key of ["q", "<C-c>"]) {
  glide.keymaps.set("copy", key, async () => {
    await clearCopySelection();
    await glide.excmds.execute("mode_change normal");
  });
}

async function showTabs() {
  const tabs = await glide.tabs.query({ currentWindow: true });
  tabs.sort((a, b) => a.index - b.index);
  await glide.commandline.show({
    title: "tabs",
    options: tabs.map((tab) => ({
      label: `${tab.index + 1}${tab.active ? " *" : ""}  ${tab.title ?? ""}`,
      description: tab.url,
      matches: ({ input }) => /^\d+$/.test(input.trim())
        ? tab.index + 1 === Number(input) : null,
      execute: () => browser.tabs.update(tab.id!, { active: true }),
    })),
  });
}

glide.excmds.create({ name: "tab", description: "Switch to a tab (1-based)" }, async ({ args_arr }) => {
  if (!args_arr.length) return showTabs();
  const n = Number(args_arr[0]);
  if (args_arr.length !== 1 || !Number.isInteger(n) || n < 1) {
    throw new Error("Use :tab N, starting at 1.");
  }
  const tab = await glide.tabs.get_first({ currentWindow: true, index: n - 1 });
  if (!tab) throw new Error(`No tab ${n}.`);
  await browser.tabs.update(tab.id!, { active: true });
});

glide.keymaps.set("normal", "<C-b>w", showTabs, { description: "List tabs (1-based)" });
glide.keymaps.set("normal", "<leader><leader>", showTabs, { description: "List tabs (1-based)" });
for (let n = 1; n <= 9; n++) {
  glide.keymaps.set("normal", `<C-b>${n}`, `tab ${n}`);
}
