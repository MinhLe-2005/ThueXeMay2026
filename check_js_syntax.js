const fs = require('fs');
const content = fs.readFileSync('src/main/webapp/booking.jsp', 'utf-8');

// Extract all <script> blocks
const scriptMatches = content.match(/<script.*?>([\s\S]*?)<\/script>/gi);
if (scriptMatches) {
    let index = 0;
    for (const match of scriptMatches) {
        const scriptContent = match.replace(/<script.*?>|<\/script>/gi, '');
        fs.writeFileSync(`temp_script_${index}.js`, scriptContent);
        try {
            require('child_process').execSync(`node -c temp_script_${index}.js`);
        } catch (e) {
            console.error(`Syntax error in script ${index}`);
            console.error(e.stderr ? e.stderr.toString() : e.message);
        }
        index++;
    }
    console.log("Syntax check complete.");
}