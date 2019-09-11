package apis

import (
	"net"
	"os"

	"github.com/gin-gonic/gin"
	log "github.com/sirupsen/logrus"
)

var (
	//IP app host ip
	IP []string
	//Hostname app host name
	Hostname string
)

func init() {
	hostname, err := os.Hostname()
	if err != nil {
		log.Errorf("Get hostname faild, %v", err.Error())
		Hostname = "Unknown"
	} else {
		Hostname = hostname
	}

	IP = make([]string, 0, 10)
	netInterfaces, err := net.Interfaces()
	if err != nil {
		log.Errorf("Get Interfaces failed, %v", err.Error())
	}

	for i := 0; i < len(netInterfaces); i++ {
		if (netInterfaces[i].Flags & net.FlagUp) != 0 {
			addrs, _ := netInterfaces[i].Addrs()

			for _, address := range addrs {
				if ipnet, ok := address.(*net.IPNet); ok && !ipnet.IP.IsLoopback() {
					if ipnet.IP.To4() != nil {
						IP = append(IP, ipnet.IP.String())
					}
				}
			}
		}
	}
}

// PrintAppInfo print application info
func PrintAppInfo(c *gin.Context) {
	c.JSON(200, gin.H{
		"IP":       IP,
		"Hostname": Hostname,
	})
}
