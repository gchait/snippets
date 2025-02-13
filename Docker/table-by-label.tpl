table {{ .ID }}\t{{ .Names }}\t{{ .Status }}\t{{ .RunningFor }}\t{{ range (split .Labels ",") }}{{ if eq . "Builder=Bob" }}Bob the Builder{{ end }}{{ end }}
