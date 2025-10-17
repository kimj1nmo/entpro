//package kr.or.ddit.page.comm.live;
//
//import java.io.BufferedReader;
//import java.io.InputStreamReader;
//import java.net.Inet4Address;
//import java.net.InetAddress;
//import java.net.NetworkInterface;
//import java.net.SocketException;
//import java.util.Enumeration;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.google.api.client.util.Value;
//
//import kr.or.ddit.vo.LiveLikeVO;
//import kr.or.ddit.vo.LiveVO;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//
//
//@Slf4j
//@Controller
//@RequestMapping("/{groupNo}/sampleLive")
//public class SampleLiveController {
//
//	@Autowired
//	LiveService liveService;
//
//	@GetMapping("/liveWatch")
//	public String main(@PathVariable String groupNo, @RequestParam(value = "streamCode") int streamCode, Model model) {
//		log.info("라이브 샘플");
//		LiveVO liveVO = liveService.getLiveInfo(streamCode);
//	    log.info("라이브: groupNo={}", groupNo);
//	    model.addAttribute("groupNo", groupNo);
//
//		String streamIp="";
//
//		//아이피 가져오기
//		try {
//		      Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
////	            System.out.println("networkInterfaces: " + networkInterfaces);
//
//		      while (networkInterfaces.hasMoreElements()) {
//		        NetworkInterface networkInterface = networkInterfaces.nextElement();
////		        System.out.println("networkInterface: " + networkInterface.getDisplayName());
//		        Enumeration<InetAddress> inetAddresses = networkInterface.getInetAddresses();
////		        System.out.println("inetAddresses: " + inetAddresses.toString());
//		        while (inetAddresses.hasMoreElements()) {
//		          InetAddress inetAddress = inetAddresses.nextElement();
////		          System.out.println("inetAddress: " + inetAddress.toString());
//		          if (inetAddress.isSiteLocalAddress()) {
////		            System.out.println("내부 IP 주소: " + inetAddress.getHostAddress());
//		            if(networkInterface.getDisplayName().contains("RTL8852AE WiFi 6 802.11ax PCIe Adapter")) {
//		            	streamIp=inetAddress.getHostAddress();
//		            }
//		          }
//		        }
//		      }
//		    } catch (Exception e) {
//		      e.printStackTrace();
//		    }
//		model.addAttribute("streamIp", streamIp);
//		model.addAttribute("streamCode", streamCode);
//		model.addAttribute("LiveVO", liveVO);
//
//
//		return "comm/sampleLive";
//	}
//
//
//
//	@ResponseBody
//	@PostMapping("/liveLikeChkAjax")
//	public LiveLikeVO liveLikeChkAjax(@RequestBody LiveLikeVO liveLikeVO) {
//	    log.info("liveLikeChkAjax-> liveLikeVO={}", liveLikeVO);
//
//		liveLikeVO=liveService.getLiveLikeChk(liveLikeVO);
//		return liveLikeVO;
//	}
//
//	@ResponseBody
//	@PostMapping("/setliveLikeAjax")
//	public LiveLikeVO setliveLikeAjax(@RequestBody LiveLikeVO liveLikeVO) {
//	    log.info("setliveLikeAjax-> liveLikeVO={}", liveLikeVO);
//
//		liveLikeVO=liveService.setliveLikeAjax(liveLikeVO);
//		return liveLikeVO;
//	}
//
//
//
//}
