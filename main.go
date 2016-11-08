package main

import (
	"io/ioutil"
	"log"
	"strings"
	"time"

	"github.com/gocql/gocql"
)

func main() {
	bIP, err := ioutil.ReadFile("VagrantBoxIP")
	if err != nil {
		log.Fatal(err)
	}

	cluster := gocql.NewCluster(strings.TrimSpace(string(bIP)))
	cluster.Keyspace = "test_keyspace"
	cluster.ProtoVersion = 4
	cluster.Consistency = gocql.One
	cluster.Timeout = 60 * time.Second
	cluster.SocketKeepalive = 60 * time.Second
	cluster.DisableInitialHostLookup = true
	cluster.PageSize = 10

	session, err := cluster.CreateSession()
	defer session.Close()
	if err != nil {
		log.Fatal(err)
	}

	iter := session.Query("SELECT * FROM basic_types LIMIT 5").Iter()
	basicValues := map[string]interface{}{}
	for iter.MapScan(basicValues) {
		log.Println(basicValues)
	}
	if err := iter.Close(); err != nil {
		log.Println(err)
	}

	iter = session.Query("SELECT * FROM collection_types LIMIT 5").Iter()
	collectionValues := map[string]interface{}{}
	for iter.MapScan(collectionValues) {
		log.Println(collectionValues)
	}
	if err := iter.Close(); err != nil {
		log.Println(err)
	}
}
