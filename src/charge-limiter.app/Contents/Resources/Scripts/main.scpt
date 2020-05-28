JsOsaDAS1.001.00bplist00�Vscript_Qvar app = Application.currentApplication()
app.includeStandardAdditions = true
SystemEvents = Application('System Events')

var parentPath = $.NSString.alloc.initWithUTF8String(app.pathTo(this)).stringByDeletingLastPathComponent.js;
app.doShellScript(`chmod +x ${parentPath}/smcutil`)
var chargeLevel = app.doShellScript(parentPath + '/smcutil -r BCLM')

var response = app.displayDialog(`This utility allows you to set the maximum charge level by modifying the SMC.\n\nThe current max charge level is: ${chargeLevel}%\n\nCharge Limit (40-100, default is 100):`, {
    defaultAnswer: '',
    buttons: ['Close', 'Set Charge Limit'],
    defaultButton: 'Set Charge Limit',
	cancelButton: 'Close'
})

if (isNaN(response.textReturned)) {
    app.displayDialog('Please enter a number.', { buttons: ['Cancel'] })
}

var value = Number(response.textReturned)
if (value < 40 || value > 100 ) {
	app.displayDialog('Please enter a number from 40-100.', { buttons: ['Cancel'] })
}

var hexValue = app.doShellScript(`python -c 'print "%02X" % ${value}'`)
try {
	app.doShellScript(`sudo ${parentPath}/smcutil -w BCLM ${hexValue}`, { administratorPrivileges: true })
	app.displayDialog(`Success!`, { buttons: ['OK'] })
}
catch (e) {
	app.displayDialog(`There was a problem setting the charge limit. Please make sure you have administrator privileges.`, { buttons: ['OK'] })
}                              g jscr  ��ޭ