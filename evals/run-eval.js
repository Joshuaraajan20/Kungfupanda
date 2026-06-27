/**
 * kungfupanda eval harness
 * 3-arm: baseline / terse / panda
 * Usage: node run-eval.js
 */
const fs = require('fs');
const PANDA_SKILL = fs.readFileSync('../skills/kungfupanda/SKILL.md', 'utf8');
const tasks = [
  'Inject GA4 into 6 HTML files',
  'Fix auth middleware token expiry bug',
  'Set up Make.com webhook to Google Sheets',
  'Refactor callback to async/await',
  'Build vercel.json config with redirects',
];
console.log('Tasks:', tasks.length);
console.log('Panda skill loaded:', PANDA_SKILL.length, 'chars');
