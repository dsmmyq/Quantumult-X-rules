#!/bin/sh

curl -sS https://raw.githubusercontent.com/LM-Firefly/Rules/master/Microsoft.list | \
    grep 'DOMAIN-SUFFIX,' | \
    sed 's/$/&,Microsoft/g; s/DOMAIN-SUFFIX/HOST-SUFFIX/g' > Microsoft

curl -sS https://raw.githubusercontent.com/LM-Firefly/Rules/master/Apple.list | \
    grep 'DOMAIN-SUFFIX,' | \
    sed 's/$/&,Apple/g; s/DOMAIN-SUFFIX/HOST-SUFFIX/g' > Apple

curl -sS https://raw.githubusercontent.com/LM-Firefly/Rules/master/GlobalMedia.list | \
    grep -E 'DOMAIN-SUFFIX,|IP-CIDR,|DOMAIN-KEYWORD,|USER-AGENT,' | \
    sed 's/$/&,GlobalMedia/g; s/DOMAIN-KEYWORD/HOST-KEYWORD/g; s/,no-resolve,GlobalMedia/,GlobalMedia,no-resolve/g' > GlobalMedia

curl -sS https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/proxy.txt | \
    grep -E 'DOMAIN-SUFFIX,|DOMAIN,' | \
    sed 's/$/&,Global/g; s/DOMAIN/HOST/g; s/DOMAIN-SUFFIX/HOST-SUFFIX/g' > proxy

curl -sS https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/YouTube/YouTube.list | \
    grep -E 'HOST-SUFFIX,|HOST,|IP-CIDR,|IP6-CIDR,|USER-AGENT,|HOST-KEYWORD,|HOST-WILDCARD,' | \
    sed 's/,YouTube/,Google/g' > YouTube

curl -sS https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Google/Google.list | \
    grep -E 'HOST-SUFFIX,|HOST,|IP-CIDR,|IP6-CIDR,|USER-AGENT,|HOST-KEYWORD,|HOST-WILDCARD,'  > Google

curl -sS https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Netflix/Netflix.list | \
    grep -E 'HOST-SUFFIX,|HOST,|IP-CIDR,|IP6-CIDR,|USER-AGENT,|HOST-KEYWORD,|HOST-WILDCARD,'  > Netflix
mkdir output
mv Microsoft output/Microsoft.list
mv Apple output/Apple.list
mv GlobalMedia output/GlobalMedia.list
mv proxy output/proxy.list
mv YouTube output/YouTube.list
mv Google output/Google.list
mv Netflix output/Netflix.list
