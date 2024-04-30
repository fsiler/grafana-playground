mkdir c:/grafana-alloy/
$ProgressPreference = 'SilentlyContinue'    # Subsequent calls do not display UI.
iwr https://github.com/grafana/alloy/releases/download/v1.0.0/alloy-installer-windows-amd64.exe.zip -outfile c:/grafana-alloy/install.zip
$ProgressPreference = 'Continue'    # Subsequent calls do not display UI.
expand-archive -path "c:/grafana-alloy/install.zip" -destinationpath "c:/grafana-alloy"
& c:/grafana-alloy/alloy-installer-windows-amd64.exe /S /CONFIG=C:\\grafana-alloy\\alloy.river
