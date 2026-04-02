# my-claw

A personal Claude Code CLI — clean-room Python implementation.

## Inspired by

- [cc-mini](https://github.com/e10nMa2k/cc-mini) — Python architecture, tools, buddy system, memory, skills
- [claw-code](https://github.com/ultraworkers/claw-code) — Rust CLI design, REPL UX, slash command system
- [nanobot](https://github.com/HKUDS/nanobot) — Ultra-lightweight OpenClaw agent approach

## Features

- **Interactive REPL** — `prompt_toolkit`-based input with slash-command autocomplete
- **Streaming engine** — real-time LLM output with tool execution and retry logic
- **Multi-provider** — Anthropic and OpenAI-compatible endpoints
- **Tools** — Bash, Read, Write, Edit, Glob, Grep, Agent (sub-workers)
- **Session persistence** — JSONL-based history with `/resume` and `/history`
- **Context compaction** — `/compact` to summarise long conversations
- **Memory system** — append-only daily logs + `/dream` consolidation
- **Skills** — Markdown-based slash commands (`/simplify`, `/review`, `/commit`, `/test`)
- **Coordinator/worker mode** — parallel sub-agent delegation
- **Sandbox** — configurable command safety layer
- **Buddy** — companion pet system with Pokémon-inspired idle adventure

## Install

```bash
pip install -e .
```

## Usage

```bash
my-claw                        # start interactive REPL
my-claw --model sonnet         # specify model
my-claw --yes                  # auto-approve all tool permissions
my-claw -p "fix the tests"     # one-shot prompt (non-interactive)
```

## Slash commands

| Command | Description |
|---------|-------------|
| `/help` | Show all commands |
| `/compact` | Compress conversation context |
| `/resume` | Resume a past session |
| `/history` | List saved sessions |
| `/clear` | Start a new session |
| `/cost` | Show token usage and cost |
| `/model` | Switch model interactively |
| `/memory` | Show memory index |
| `/dream` | Consolidate daily logs into memory |
| `/skills` | List available skills |
| `/simplify` | Review and clean up changed code |
| `/review` | Code review without auto-fix |
| `/commit` | Generate and create a git commit |
| `/test` | Run the project's test suite |
| `/buddy` | Companion pet commands |

## Configuration

Config file: `~/.config/my-claw/config.toml` or `.my-claw.toml` in project root.

```toml
model = "claude-sonnet-4-6"
base_url = "http://your-api-endpoint/v1"
api_key = "sk-..."
```

Or via environment variables:
```bash
export MY_CLAW_MODEL=claude-sonnet-4-6
export ANTHROPIC_API_KEY=sk-...
export ANTHROPIC_BASE_URL=http://your-api-endpoint/v1
```

## Project structure

```
my_claw/
├── main.py           # REPL entry point
├── engine.py         # LLM streaming + tool execution
├── llm.py            # Anthropic / OpenAI client
├── config.py         # Configuration loading
├── session.py        # Session persistence (JSONL)
├── commands.py       # Slash command dispatch
├── context.py        # System prompt builder
├── permissions.py    # Tool permission checker
├── compact.py        # Context compaction
├── memory.py         # Memory system
├── skills.py         # Skill loader
├── coordinator.py    # Coordinator/worker mode
├── worker_manager.py # Sub-agent threading
├── cost_tracker.py   # Token & cost tracking
├── tools/            # Tool implementations
├── sandbox/          # Command sandbox
└── buddy/            # Companion pet + poke_game
```
