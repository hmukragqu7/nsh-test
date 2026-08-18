async function run() {
  try {
    const res = await fetch('https://novelsignaturehomes.com/properties/');
    const html = await res.text();
    
    console.log('Searching for background-image or SVG urls...');
    const regex = /url\(['"]?([^'"]+\.svg|[^'"]+\.png|[^'"]+\.jpg|[^'"]+\.webp)['"]?\)/gi;
    let match;
    while ((match = regex.exec(html)) !== null) {
      console.log('Found background URL:', match[1]);
    }
    
    // Also search for classes containing background styles
    const lines = html.split('\n');
    lines.forEach((line, i) => {
      if (line.includes('background') || line.includes('topo') || line.includes('pattern')) {
        console.log(`Line ${i}:`, line.trim().slice(0, 300));
      }
    });
  } catch (err) {
    console.error(err);
  }
}

run();
