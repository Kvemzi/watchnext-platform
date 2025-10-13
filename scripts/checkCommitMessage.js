#!/usr/bin/env node
const fs = require("fs");

const commitMsgFile = process.argv[2];
const commitMsg = fs.readFileSync(commitMsgFile, "utf8").trim().split("\n")[0];

const allowedTypes = /^(feat|fix|docs|style|refactor|test|chore|patch):/;

if (!allowedTypes.test(commitMsg)) {
  console.error("❌ Commit poruka mora počinjati s jednim od sljedećih tipova:");
  console.error("   feat, fix, docs, style, refactor, test, chore, patch\n");
  console.error("Primjer: feat: dodan endpoint za sadržaj");
  process.exit(1);
}

console.log("✅ Commit poruka ispravna.");
process.exit(0);
