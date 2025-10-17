package kr.or.ddit.page.comm.live;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.PathParam;
import kr.or.ddit.page.comm.PostService;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.LiveChatVO;
import kr.or.ddit.vo.LiveLikeVO;
import kr.or.ddit.vo.LiveVO;
import kr.or.ddit.vo.VodVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;


@RequestMapping("/{groupNo}")
@Slf4j
@Controller
public class LiveController {

	@Autowired
	LiveService liveService;
	@Autowired
	PostService postService;

	@Autowired
	UploadController uploadController;


//라이브 리스트 화면
///////////////////////////////////////////////////////////////////////////////////////////////
	@GetMapping("/live")
	public String live(@PathVariable int groupNo, Model model,HttpSession session) {
		log.info("라이브: groupNo={}", groupNo);
		model.addAttribute("groupNo", groupNo);
	    List<CommunityVO> communityVOList = postService.list(groupNo);

		   // 세션에 그룹번호를 넣어줌
	    session.setAttribute("groupNo", groupNo);

	    // groupName 전달
	    String groupName = postService.getGroupName(groupNo);
	    model.addAttribute("groupName", groupName);

	    // groupName 전달
	    int communityMember = postService.getCountMem(groupNo);
	    model.addAttribute("communityMember", communityMember);

	    // 모델에 데이터 추가
	    model.addAttribute("communityVOList", communityVOList);
	    model.addAttribute("groupNo", groupNo); // groupNo를 명시적으로 추가

	    List <LiveVO> liveVOList = liveService.liveList(groupNo);
	    List <VodVO> vodVOList = liveService.VodList(groupNo);

	    model.addAttribute("liveVOList", liveVOList);
	    model.addAttribute("vodVOList", vodVOList);



		return "comm/live";
	}


	@ResponseBody
	@GetMapping("/liveListAjax")
	public List <LiveVO> liveListAjax(@PathVariable int groupNo) {
		log.info("liveListAjax-> groupNo={}", groupNo);

		List <LiveVO> liveVOList = liveService.liveList(groupNo);
		log.info("liveListAjax-> liveVOList={}", liveVOList);
		return liveVOList;
	}
	@ResponseBody
	@GetMapping("/oldLiveListAjax")
	public List <LiveVO> oldLiveListAjax(@PathVariable int groupNo) {
		log.info("oldLiveListAjax-> groupNo={}", groupNo);

		List <LiveVO> liveVOList = liveService.oldLiveList(groupNo);
		log.info("oldLiveListAjax-> liveVOList={}", liveVOList);
		return liveVOList;
	}

	@ResponseBody
	@PostMapping("/getSumnail")
	public VodVO getSumnail(@RequestBody HashMap<String, Object> map) {
		log.info("getSumnail-> map={}", map);

		VodVO vodVO=liveService.getSumnail(map);

		log.info("getSumnail-> vodVO={}", vodVO);
		return vodVO;
	}
	@ResponseBody
	@PostMapping("/getArtistAuthChk")
	public Integer getArtistAuthChk(@RequestBody HashMap<String, Object> map) {
	    log.info("getArtistAuthChk-> map={}", map);

	    Integer result=liveService.getArtistAuthChk(map);

	    log.info("getArtistAuthChk-> result={}", result);
		return result;
	}


//////////////////////////////////////////////////////////////////////////////////////////





	@GetMapping("/liveStream")
	public String liveStream(@PathVariable String groupNo, Model model) {
		log.info("라이브스트림: groupNo={}", groupNo);
		model.addAttribute("groupNo", groupNo);

		String streamIp = "";

		try {
			Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
//		            System.out.println("networkInterfaces: " + networkInterfaces);

			while (networkInterfaces.hasMoreElements()) {
				NetworkInterface networkInterface = networkInterfaces.nextElement();
//			        System.out.println("networkInterface: " + networkInterface.getDisplayName());
				Enumeration<InetAddress> inetAddresses = networkInterface.getInetAddresses();
//			        System.out.println("inetAddresses: " + inetAddresses.toString());
				while (inetAddresses.hasMoreElements()) {
					InetAddress inetAddress = inetAddresses.nextElement();
//			          System.out.println("inetAddress: " + inetAddress.toString());
					if (inetAddress.isSiteLocalAddress()) {
//			            System.out.println("내부 IP 주소: " + inetAddress.getHostAddress());
						if (networkInterface.getDisplayName().contains("RTL8852AE WiFi 6 802.11ax PCIe Adapter")) {
							streamIp = inetAddress.getHostAddress();
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("streamIp", streamIp);

		return "comm/LiveStream";
	}

	@ResponseBody
	@GetMapping("/liveStreamKeyAjax")
	public int liveStreamKeyAjax(@PathVariable String groupNo, Model model) {
		log.info("라이브: groupNo={}", groupNo);

		// 비동기로 방송스트림 키를 발급받는다
		int keyNo = liveService.getKeyNo();
		model.addAttribute("groupNo", groupNo);
		return keyNo;
	}
/////////////////////////////////////////////////////////////////////////////////여기서 부터는 보는쪽 관리


	@GetMapping("/liveWatch")
	public String main(@PathVariable String groupNo, @RequestParam(value = "streamCode") int streamCode, Model model) {
		log.info("라이브 샘플");
		HashMap< String, Object> map=new HashMap<>();
		map.put("groupNo", groupNo);
		map.put("streamCode", streamCode);
		LiveVO liveVO = liveService.getLiveInfo(map);
	    log.info("라이브: groupNo={}", groupNo);
	    model.addAttribute("groupNo", groupNo);

		String streamIp="";

		//아이피 가져오기
		try {
		      Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
//	            System.out.println("networkInterfaces: " + networkInterfaces);

		      while (networkInterfaces.hasMoreElements()) {
		        NetworkInterface networkInterface = networkInterfaces.nextElement();
//		        System.out.println("networkInterface: " + networkInterface.getDisplayName());
		        Enumeration<InetAddress> inetAddresses = networkInterface.getInetAddresses();
//		        System.out.println("inetAddresses: " + inetAddresses.toString());
		        while (inetAddresses.hasMoreElements()) {
		          InetAddress inetAddress = inetAddresses.nextElement();
//		          System.out.println("inetAddress: " + inetAddress.toString());
		          if (inetAddress.isSiteLocalAddress()) {
//		            System.out.println("내부 IP 주소: " + inetAddress.getHostAddress());
		            if(networkInterface.getDisplayName().contains("RTL8852AE WiFi 6 802.11ax PCIe Adapter")) {
		            	streamIp=inetAddress.getHostAddress();
		            }
		          }
		        }
		      }
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
		model.addAttribute("streamIp", streamIp);
		model.addAttribute("streamCode", streamCode);
		model.addAttribute("LiveVO", liveVO);


		return "comm/sampleLive";
	}



	@ResponseBody
	@PostMapping("/liveLikeChkAjax")
	public LiveLikeVO liveLikeChkAjax(@RequestBody LiveLikeVO liveLikeVO) {
	    log.info("liveLikeChkAjax-> liveLikeVO={}", liveLikeVO);

		liveLikeVO=liveService.getLiveLikeChk(liveLikeVO);
		return liveLikeVO;
	}

	@ResponseBody
	@PostMapping("/setliveLikeAjax")
	public LiveLikeVO setliveLikeAjax(@RequestBody LiveLikeVO liveLikeVO) {
	    log.info("setliveLikeAjax-> liveLikeVO={}", liveLikeVO);

		liveLikeVO=liveService.setliveLikeAjax(liveLikeVO);
		return liveLikeVO;
	}

	@ResponseBody
	@GetMapping("/chatSetAjax")
	public List<LiveChatVO> chatSetAjax(@PathVariable String groupNo, @RequestParam("streamCode") int streamCode, Model model) {
	    log.info("chatSetAjax-> streamCode={}", streamCode);
	    List<LiveChatVO> liveChatVOList=liveService.chatSetAjax(streamCode);

	    	return liveChatVOList;
	}
	@ResponseBody
	@PostMapping("/setCommRegNick")
	public CommunityVO setCommRegNick(@PathVariable String groupNo,@RequestBody HashMap<String, Object> map) {
	    log.info("setCommRegNick-> map={}", map);
	    map.put("groupNo", groupNo);

	    CommunityVO communityVO=liveService.setCommRegNick(map);

	    log.info("setCommRegNick-> result={}", communityVO);
		return communityVO;
	}

	@ResponseBody
	@PostMapping("/setArtistSetAjax")
	public CommunityVO setArtistSetAjax(@PathVariable String groupNo,@RequestBody HashMap<String, Object> map) {
	    log.info("setCommRegNick-> map={}", map);
	    map.put("groupNo", groupNo);

	    CommunityVO communityVO=liveService.setArtistSet(map);

	    log.info("setCommRegNick-> result={}", communityVO);
		return communityVO;
	}



	@ResponseBody
	@PostMapping("/createLiveAjax")
	public LiveVO createLiveAjax(@PathVariable String groupNo, Model model, @ModelAttribute LiveVO liveVO
            ) {
	    log.info("setliveLikeAjax-> LiveVO={}", liveVO);

	    int result= liveService.createLiveAjax(liveVO);
	    log.info("setliveLikeAjax-> LiveVO후={}", liveVO);
		return liveVO;
	}
	@PostMapping("/endLiveAjax")
	public LiveVO endLiveAjax(@RequestBody LiveVO liveVO) {
	    log.info("endLiveAjax-> LiveVO={}", liveVO);

	    liveService.endLiveAjax(liveVO);
	    log.info("endLiveAjax-> LiveVO후={}", liveVO);
		return liveVO;
	}
///////////////////////////////////////////////////////비디오


	@GetMapping("/vodWatch")
	public String vodWatch(@PathVariable String groupNo, @RequestParam(value = "streamCode") int streamCode, Model model) {
		log.info("vod 샘플");
		HashMap< String, Object> map=new HashMap<>();
		map.put("groupNo", groupNo);
		map.put("streamCode", streamCode);
		LiveVO liveVO = liveService.getLiveInfo(map);
		VodVO vodVO = liveService.getVodInfo(map);

	    log.info("라이브: groupNo={}", groupNo);
	    model.addAttribute("groupNo", groupNo);

		String streamIp="";

		//아이피 가져오기
		try {
		      Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
//	            System.out.println("networkInterfaces: " + networkInterfaces);

		      while (networkInterfaces.hasMoreElements()) {
		        NetworkInterface networkInterface = networkInterfaces.nextElement();
//		        System.out.println("networkInterface: " + networkInterface.getDisplayName());
		        Enumeration<InetAddress> inetAddresses = networkInterface.getInetAddresses();
//		        System.out.println("inetAddresses: " + inetAddresses.toString());
		        while (inetAddresses.hasMoreElements()) {
		          InetAddress inetAddress = inetAddresses.nextElement();
//		          System.out.println("inetAddress: " + inetAddress.toString());
		          if (inetAddress.isSiteLocalAddress()) {
//		            System.out.println("내부 IP 주소: " + inetAddress.getHostAddress());
		            if(networkInterface.getDisplayName().contains("RTL8852AE WiFi 6 802.11ax PCIe Adapter")) {
		            	streamIp=inetAddress.getHostAddress();
		            }
		          }
		        }
		      }
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
		model.addAttribute("streamIp", streamIp);
		model.addAttribute("streamCode", streamCode);
		model.addAttribute("LiveVO", liveVO);
		model.addAttribute("VodVO", vodVO);


		return "comm/videoDetail";
	}

}
