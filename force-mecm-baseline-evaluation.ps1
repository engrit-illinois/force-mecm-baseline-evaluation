# Static list of computer names
$computers = @(
	"engrit-mms-tvm1",
	"engrit-mms-tvm2",
	"engrit-mms-tvm3",
	"engrit-mms-tvm4",
	"engrit-mms-tvm5",
	"engrit-mms-tvm6",
	"engrit-mms-tvm7",
	"engrit-mms-tvm8",
	"engrit-mms-tvm9"
)

# TODO: Get list of computers from collection instead?

foreach($computer in $computers) {
    # Get baselines for this computer
    $baselines = Get-WmiObject -ComputerName $computer -Namespace root\ccm\dcm -Class SMS_DesiredConfiguration
    foreach($baseline in $baselines) {
        # Evaluate this baseline
        ([wmiclass]"\\$computer\root\ccm\dcm:SMS_DesiredConfiguration").TriggerEvaluation($baseline.Name, $baseline.Version)
    }
}
