#!/bin/sh
c="sudo dmidecode -s"

echo "# bios"
$c bios-vendor
$c bios-version
$c bios-release-date

echo "# system"
$c system-manufacturer
$c system-product-name
$c system-version
$c system-serial-number
$c system-uuid

echo "# baseboard"
$c baseboard-manufacturer
$c baseboard-product-name
$c baseboard-version
$c baseboard-serial-number
$c baseboard-asset-tag

echo "# chassis"
$c chassis-manufacturer
$c chassis-type
$c chassis-version
$c chassis-serial-number
$c chassis-asset-tag

echo "# processor"
$c processor-family
$c processor-manufacturer
$c processor-version
$c processor-frequency
