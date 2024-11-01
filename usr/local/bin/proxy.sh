#!/bin/bash
export ProIP="<PLACE_HOLDER>"
export http_proxy=$"$ProIP"
export https_proxy=$"$ProIP"
$@
