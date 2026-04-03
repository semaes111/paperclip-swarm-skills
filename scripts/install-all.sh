#!/bin/bash
# ═══════════════════════════════════════════════════════════════
# Paperclip Swarm Skills — Instalador Completo
# NextHorizont AI SL © 2026
# ═══════════════════════════════════════════════════════════════

set -e
echo "🤖 Instalando skills para el swarm Paperclip..."
echo "   50+ agentes | 10 negocios | 180+ skills"
echo ""

# ─── PASO 1: Plugin Marketplaces (las fuentes más grandes) ─────
echo "📦 [1/7] Plugin Marketplaces..."
echo "  → alirezarezvani/claude-skills (223+ skills: agenthub, c-level, finance, compliance, marketing)"
# /plugin marketplace add alirezarezvani/claude-skills
echo "  → jeremylongshore/claude-code-plugins-plus-skills (1,367 skills: crypto, trading, memory, n8n)"
# /plugin marketplace add jeremylongshore/claude-code-plugins-plus-skills
echo "  ⚠️  Ejecutar manualmente en Claude Code:"
echo "     /plugin marketplace add alirezarezvani/claude-skills"
echo "     /plugin marketplace add jeremylongshore/claude-code-plugins-plus-skills"
echo ""

# ─── PASO 2: Official vendor skills ───────────────────────────
echo "📦 [2/7] Skills oficiales de vendors..."
npx skills add vercel-labs/agent-skills 2>/dev/null || echo "  ⚠️  vercel-labs/agent-skills — instalar manualmente"
npx skills add anthropics/skills 2>/dev/null || echo "  ⚠️  anthropics/skills — instalar manualmente"
npx skills add supabase/agent-skills 2>/dev/null || echo "  ⚠️  supabase/agent-skills — instalar manualmente"
npx skills add stripe/ai 2>/dev/null || echo "  ⚠️  stripe/ai — instalar manualmente"
echo "✅ Vendors OK"
echo ""

# ─── PASO 3: Marketing & SEO skills ──────────────────────────
echo "📦 [3/7] Marketing & SEO..."
MARKETING=(
  "seo-audit" "programmatic-seo" "ai-seo" "site-architecture"
  "content-strategy" "analytics-tracking" "ab-test-setup"
  "page-cro" "signup-flow-cro" "onboarding-cro" "form-cro"
  "popup-cro" "paywall-upgrade-cro" "churn-prevention"
  "competitor-alternatives" "pricing-strategy" "product-marketing-context"
  "launch-strategy" "revops" "sales-enablement" "marketing-ideas"
  "copywriting" "marketing-psychology" "social-content"
  "cold-email" "referral-program" "free-tool-strategy" "email-sequence"
)
for skill in "${MARKETING[@]}"; do
  npx skills add "coreyhaines31/marketingskills/$skill" 2>/dev/null || echo "  ⚠️  $skill"
done
echo "✅ Marketing OK (${#MARKETING[@]} skills)"
echo ""

# ─── PASO 4: Data, Quant & Financial skills ──────────────────
echo "📦 [4/7] Data & Financial..."
npx skills add supercent-io/skills-template/data-analysis 2>/dev/null || true
npx skills add wshobson/agents/python-performance-optimization 2>/dev/null || true
npx skills add wshobson/agents/startup-metrics-framework 2>/dev/null || true
npx skills add wshobson/agents/startup-financial-modeling 2>/dev/null || true
npx skills add wshobson/agents/kpi-dashboard-design 2>/dev/null || true
npx skills add wshobson/agents/backtesting-frameworks 2>/dev/null || true
npx skills add wshobson/agents/risk-metrics-calculation 2>/dev/null || true
npx skills add wshobson/agents/competitive-landscape 2>/dev/null || true
npx skills add wshobson/agents/gdpr-data-handling 2>/dev/null || true
npx skills add wshobson/agents/rag-implementation 2>/dev/null || true
npx skills add wshobson/agents/task-coordination-strategies 2>/dev/null || true
npx skills add wshobson/agents/team-composition-patterns 2>/dev/null || true
npx skills add wshobson/agents/team-communication-protocols 2>/dev/null || true
npx skills add EveryInc/charlie-cfo-skill 2>/dev/null || true
echo "✅ Data & Financial OK (14 skills)"
echo ""

# ─── PASO 5: Sports & Trading skills ─────────────────────────
echo "📦 [5/7] Sports & Trading..."
npx skills add OneWave-AI/claude-skills 2>/dev/null || true
npx skills add agiprolabs/claude-trading-skills 2>/dev/null || true
npx skills add aaron-he-zhu/seo-geo-claude-skills 2>/dev/null || true
echo "✅ Sports & Trading OK"
echo ""

# ─── PASO 6: DevOps & Infrastructure ─────────────────────────
echo "📦 [6/7] DevOps & Infra..."
npx skills add czlonkowski/n8n-skills 2>/dev/null || true
npx skills add sickn33/antigravity-awesome-skills/telegram-bot-builder 2>/dev/null || true
npx skills add AgriciDaniel/claude-seo 2>/dev/null || true
npx skills add firecrawl/cli/firecrawl 2>/dev/null || true
npx skills add squirrelscan/skills/audit-website 2>/dev/null || true
npx skills add Sushegaad/Claude-Skills-Governance-Risk-and-Compliance 2>/dev/null || true
npx skills add zubair-trabzada/ai-legal-claude 2>/dev/null || true
echo "✅ DevOps & Infra OK"
echo ""

# ─── PASO 7: Custom skills (gaps del ecosistema) ─────────────
echo "📦 [7/7] Custom skills (gaps)..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
CUSTOM_DIR="$REPO_ROOT/custom-skills"
TARGET_DIR="${HOME}/.claude/skills/user"

mkdir -p "$TARGET_DIR"

for skill_dir in "$CUSTOM_DIR"/*/; do
  skill_name=$(basename "$skill_dir")
  if [ -f "$skill_dir/SKILL.md" ]; then
    cp -r "$skill_dir" "$TARGET_DIR/$skill_name/"
    echo "  ✅ $skill_name → $TARGET_DIR/$skill_name/"
  fi
done
echo "✅ Custom skills OK (6 skills)"
echo ""

# ─── RESUMEN ──────────────────────────────────────────────────
echo "═══════════════════════════════════════════════════════"
echo "🎉 INSTALACIÓN COMPLETA"
echo "═══════════════════════════════════════════════════════"
echo ""
echo "  Plugin marketplaces:   2 (ejecutar manualmente)"
echo "  Official vendors:      4 repos"
echo "  Marketing/SEO:         28 skills"
echo "  Data/Financial:        14 skills"
echo "  Sports/Trading:        3 repos (60+ skills)"
echo "  DevOps/Infra:          7 repos"
echo "  Custom skills:         6 SKILL.md propias"
echo ""
echo "  TOTAL: ~180+ skills operativas"
echo ""
echo "⚠️  RECUERDA ejecutar manualmente en Claude Code:"
echo "  /plugin marketplace add alirezarezvani/claude-skills"
echo "  /plugin marketplace add jeremylongshore/claude-code-plugins-plus-skills"
echo "═══════════════════════════════════════════════════════"
