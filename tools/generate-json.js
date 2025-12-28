import { readdir } from 'fs/promises';
import { extname, basename } from 'path';
import { writeFile } from 'fs/promises';

const designDir = '../design';
const outputFile = '../cards.json';

async function main() {
  const files = await readdir(designDir);
  const pngFiles = files.filter(file => extname(file).toLowerCase() === '.png');
  const cardData = pngFiles.map(file => ({ img: file }));

  await writeFile(outputFile, JSON.stringify(cardData, null, 2));

  console.log(`Generated ${outputFile} with ${cardData.length} cards.`);
}

main();
