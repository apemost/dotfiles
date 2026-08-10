#!/usr/bin/env bash

export GOTOOLCHAIN=local

go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/gopls@latest
