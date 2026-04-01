#!/usr/bin/env bash

set -euo pipefail

EXCALIDRAW_ROOT="${HOME}/.codex/vendor/mcp_excalidraw"
PORT="${PORT:-3000}"

if [[ ! -d "${EXCALIDRAW_ROOT}" ]]; then
  echo "Excalidraw MCP repo not found at ${EXCALIDRAW_ROOT}."
  echo "Expected the verified local install created for Codex MCP."
  exit 1
fi

if [[ ! -d "${EXCALIDRAW_ROOT}/node_modules" ]]; then
  echo "Dependencies are missing under ${EXCALIDRAW_ROOT}."
  echo "Run: cd ${EXCALIDRAW_ROOT} && npm ci"
  exit 1
fi

echo "Starting Excalidraw canvas on http://localhost:${PORT}"
cd "${EXCALIDRAW_ROOT}"
PORT="${PORT}" npm run canvas
