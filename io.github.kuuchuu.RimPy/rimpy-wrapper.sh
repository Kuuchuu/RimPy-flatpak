#!/bin/sh
app_dir="/app"
rimpy_dir="/var/rimpy"

rimpyLink() {
    mkdir -p "$rimpy_dir"

    find "$app_dir" -type d | while read -r dir; do
        new_dir="${dir/$app_dir/$rimpy_dir}"
        mkdir -p "$new_dir"
    done

    find "$app_dir" -type f | while read -r file; do
        new_file="${file/$app_dir/$rimpy_dir}"
        ln -s "$file" "$new_file"
    done

    echo "Directory structure replicated and files linked from $app_dir to $rimpy_dir."
}

if [ ! -f "$rimpy_dir/RimPy" ]; then
    rimpyLink
fi

echo
echo "Launching RimPy"

echo "RimPy Log: $HOME/.config/RimPy Mod Manager/rimpy.flatpak.log"
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>"$HOME/.config/RimPy Mod Manager/rimpy.flatpak.log" 2>&1
#export LD_DEBUG=libs,files
#export REQUESTS_CA_BUNDLE='/app/certifi/cacert.pem'
#export SSL_CERT_FILE='/app/certifi/cacert.pem'
cd /var/rimpy || exit
LD_PRELOAD="/app/lib/libpcre.so.3:/app/lib/libnssckbi.so:$LD_PRELOAD" ./RimPy