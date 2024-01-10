files="../azure_virtual_network/main.tf ../azure_virtual_network/run.sh"

folders=()
for f in .github/workflows/kstp-nsxt-cicd.yml azure_virtual_network/run.sh azure_virtual_network/terraform.tf backend/terraform.tf; \
do \
    echo "${f}" | egrep -qi ".*tf$"
    if [ $? -eq 0 ]; then
        echo "Adding $(dirname $f) to folders"; \
        folders+=($(dirname $f)); \
    else
        echo "File ${f} skipped."
    fi
done