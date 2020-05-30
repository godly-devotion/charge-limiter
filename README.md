# charge-limiter

Set charge limit for MacBooks.

## Description

This app modifies a parameter called `BCLM` (presumably "Battery Charging Level Max") in the SMC which limits the charge of the battery to a set value.

The source code can be viewed by opening `src/charge-limiter.app` in Apple's Script Editor. It is written in Javascript Application Scripting (or JXA).

The companion `smcutil` binary (located under `src/charge-limiter.app/Contents/Resources`) was copied from [this repository](https://github.com/sicreative/BatteryStatusShow/blob/master/BatteryStatusShow/smcutil/Products/usr/local/bin/smcutil). The source code for `smcutil` is also available there.

## Releases

Download the latest version from the [releases](https://github.com/godly-devotion/charge-limiter/releases) page.

## Updates

This app will automatically check and notify you for any updates when you run it.

## Running

The app is not code signed so you need to right-click on the app and select "Open" to bypass Gatekeeper's warning.
