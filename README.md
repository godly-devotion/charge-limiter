# Charge Limiter

macOS app to set battery charge limit for Intel MacBooks

## Description

This app modifies a parameter called `BCLM` (presumably "Battery Charge Level Max") in the SMC which limits the charge of the battery to a set value. It also modifies a parameter called `BFCL` ("Battery Final Charge Level") which controls the MagSafe LED indicator light to display the correct status.

The source code can be viewed by opening `src/Charge Limiter.app` in Apple's Script Editor. It is written in Javascript Application Scripting (or JXA).

The companion `bclm` binary (located under `src/Charge Limiter.app/Contents/Resources`) was copied from [this repository](https://github.com/zackelia/bclm). The source code for `bclm` is also available there.

## Releases

Download the latest version from the [releases](https://github.com/godly-devotion/charge-limiter/releases) page.

## Running

When trying to open the app for the first time, Gatekeeper will prevent you from doing so because the app is not code signed. In order to bypass this warning, you need to right-click on the app and select "Open". You will have to do this twice in order to get the option to open the app.

After setting a charge limit, the app will silently run and reapply the desired charge level again if you restart your Mac. If you wish to fully charge the battery again, set the charge limit to "100". This will also remove the charge limit persistency on boot. Afterwards, if you do not need the app anymore you can safely move it to the trash.

## Updates

This app will automatically check and notify you for any updates when you run it.
