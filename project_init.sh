#!/usr/bin/env bash

set -e

read -p "Project Name: " name

if [ -d "$name" ]; then
  echo "Directory '$name' already exists."
  exit 1
fi

mkdir "$name"
cd "$name"

mkdir -p src

pnpm init --yes
pnpm add -D typescript tsx @types/node --allow-build=esbuild
pnpm tsc --init

echo 'console.log("Hello World")' > src/index.ts

npm pkg set scripts.dev="tsx watch src/index.ts"
npm pkg set scripts.build="tsc"
npm pkg set scripts.start="node dist/index.js"

cat > tsconfig.json <<'EOF'
{
  "compilerOptions": {
    "rootDir": "./src",
    "outDir": "./dist",

    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "target": "esnext",

    "types": ["node"],

    "sourceMap": true,
    "declaration": true,
    "declarationMap": true,

    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,

    "strict": true,
    "verbatimModuleSyntax": true,
    "isolatedModules": true,
    "noUncheckedSideEffectImports": true,
    "moduleDetection": "force",
    "esModuleInterop": true,
    "skipLibCheck": true
  },
  "include": ["src"]
}
EOF

cat > .gitignore <<'EOF'
node_modules/
dist/
build/
out/
.env
*.log
*.tsbuildinfo
.vscode/
.DS_Store
EOF

echo
echo "Project '$name' created successfully."
echo "Next:"
echo "  cd $name"
echo "  pnpm dev"  