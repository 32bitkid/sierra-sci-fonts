#!/usr/bin/env node
import {readFile} from "node:fs/promises";

const keyOrder = ['trim', 'pad', 'shift', 'xor', 'rlig', 'liga', 'dlig'];
const byKeyOrder = (a, b) => keyOrder.indexOf(a) - keyOrder.indexOf(b)

let payload = JSON.parse(await readFile(process.argv[2]))

payload = {
  $schemaVersion: "v1",
  ...payload,
  sources: payload.sources.map((source) => ({
    ...source,
    mappings: source.mappings.map((mapping) => {
      if (typeof mapping === 'string') return mapping;

      const [char, unicode, name, options] = mapping;
      const opts = {};

      if (name && unicode > "00ff") {
        opts.name = name
      }

      for (const [key, val] of Object.entries(options ?? {}).sort(byKeyOrder)) {
        switch (key) {
          case 'force': {
            opts.overwrite = val;
            break;
          }
          case 'xor': {
            opts.actions = opts.actions ?? [];
            const maxLength = val.reduce((prev, v) => Math.max(prev, v.length), 0)
            opts.actions.push({[key]: val.map(v => v.replace(/\S/g, '#').padEnd(maxLength, ' '))})
            break;
          }
          default: {
            opts.actions = opts.actions ?? [];
            opts.actions.push({[key]: val})
          }
        }

      }

      return Object.keys(opts).length > 0 ? [char, unicode, opts] : [char, unicode];
    })
  }))
}

process.stdout.write(JSON.stringify(payload, null, 2));
