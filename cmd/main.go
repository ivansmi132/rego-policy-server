package main

import (
	"fmt"
	"log"
	"os/exec"

	"github.com/gin-gonic/gin"
)

func main() {
	if err := runOPABuild(); err != nil {
		log.Fatalf("Error running OPA build: %v", err)
	}

	server := gin.Default()

	server.GET("/opa-test", func(ctx *gin.Context) {
		filepath := "./bundle.tar.gz"
		ctx.Header("Content-Type", "application/gzip")
		ctx.Status(200)
		ctx.File(filepath)
	})

	server.Run("localhost:3001")
}

func runOPABuild() error {
	cmd := exec.Command("opa", "build", "-b", "policies/")
	err := cmd.Run()
	if err != nil {
		return fmt.Errorf("failed to run opa build: %w", err)
	}
	return nil
}
