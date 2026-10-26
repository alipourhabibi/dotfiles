return {
    "alipourhabibi/hippo.nvim",
    dev = true,
    lazy = false,
    opts = {
        path = "~/obsidian/SecondBrain/SecondBrain",
        notes = {
            todo = "2-Areas/routine/todo.md",
            shortmind = "2-Areas/routine/shortmind.md",
            backlog = "2-Areas/routine/backlog.md",
            routine = "2-Areas/routine/routine.md",
        },
        dashboard = {
            main = "todo",
            tabs = { "today", "shortmind", "backlog", "routine", "agenda" },
        },
        capture = { "shortmind", "today" },
        inbox = { "0-Inbox", "inbox-notes" },
        sync_message = "Last Sync: %Y-%m-%d %H:%M (Laptop)",
    },
}
