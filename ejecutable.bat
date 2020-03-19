cd C:\Users\gonzalo.morenoc\AppData\Roaming\npm

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%" 

call newman run "C:\Program Files (x86)\Jenkins\workspace\poc_api_git\POC_API.postman_collection.json" -e "C:\Program Files (x86)\Jenkins\workspace\poc_api_git\poc.postman_environment.json" -r cli,html,junit --reporter-html-export "C:\Program Files (x86)\Jenkins\workspace\poc_api_git\reportsHtml\report_%fullstamp%.html" --reporter-junit-export "C:\Program Files (x86)\Jenkins\workspace\poc_api_git\reportsJunit\reportJunit_%fullstamp%.xml" 
