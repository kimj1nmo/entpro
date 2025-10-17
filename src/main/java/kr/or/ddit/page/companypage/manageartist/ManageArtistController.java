package kr.or.ddit.page.companypage.manageartist;

import java.io.Console;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.MemberVO;


@Slf4j
@Controller
@RequestMapping("/manageArtistAjax")
public class ManageArtistController {

@Autowired
ManageArtistService manageArtistService;




//아티스트 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/artistListAjax",method=RequestMethod.POST)
	public ArticlePage<ArtistVO> artistListAjax(@RequestBody Map<String,Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
		log.info("artistListAjax->map : " + map);

		//전체 행의 수 *******
		int total = this.manageArtistService.getTotal(map);
		log.info("list->total : " + total);

		//map{currentPage=1,keyword=}
		List<ArtistVO> artistVOList = this.manageArtistService.list(map);
		log.info("list->artistVOList : " + artistVOList);

		//map.get("currentPage") : Object 타입
		int currentPage = Integer.parseInt(map.get("currentPage").toString());//Object->"1"->1
		String keyword = "";
		//검색어가 없을 수 있으므로 처리
		if(map.get("keyword")!=null) {
			keyword = map.get("keyword").toString();//"도서"
		}

		//페이지네이션
		ArticlePage<ArtistVO> articlePage
			= new ArticlePage<ArtistVO>(total, currentPage,
					10, artistVOList, keyword, "ajax");

		return articlePage;
	}


	@ResponseBody
	@RequestMapping(value="/artistListSortAjax",method=RequestMethod.POST)
	public ArticlePage<ArtistVO> artistListSortAjax(@RequestBody Map<String,Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
		log.info("artistListSortAjax->map : " + map);

		//전체 행의 수 *******
		int total = this.manageArtistService.getTotal(map);
		log.info("artistListSortAjax->total : " + total);

		//map{currentPage=1,keyword=}
		List<ArtistVO> artistVOList = this.manageArtistService.listSort(map);
		log.info("artistListSortAjax->artistVOList : " + artistVOList);

		//map.get("currentPage") : Object 타입
		int currentPage = Integer.parseInt(map.get("currentPage").toString());//Object->"1"->1
		String keyword = "";
		int mode= Integer.parseInt(map.get("mode").toString());//Object->"1"->1
		String sortName="";
		//검색어가 없을 수 있으므로 처리
		if(map.get("keyword")!=null) {
			keyword = map.get("keyword").toString();//"도서"
		}

		if(map.get("sortName")!=null) {
			sortName = map.get("sortName").toString();//"도서"
		}
		//페이지네이션
		ArticlePage<ArtistVO> articlePage
			= new ArticlePage<ArtistVO>(total, currentPage,
					10	, artistVOList, keyword, mode,sortName);

		return articlePage;
	}

	//아티스트 상세 가져오기
	@ResponseBody
	@PostMapping("/artistDetailAjax")
	public ArtistVO artistDetailAjax(@RequestBody Map<String, Integer> requestBody) {
		int artistNo = (int) requestBody.get("artistNo"); // JSON에서 artistNo 값을 추출
	    log.info("artistDetailAjax->artistNo : " + artistNo);
	    ArtistVO artistVO=manageArtistService.artistDetail(artistNo);
	    log.info("artistDetailAjax->artistVO : " + artistVO);

	    return artistVO; // 실제 데이터 반환
	}

	//아이디 체크하기
	@ResponseBody
	@PostMapping("/memIdChkAjax")
	public ArtistVO memIdChkAjax(@RequestBody ArtistVO artistVO ) {
	    log.info("memIdChkAjax->artistVO : " + artistVO);
	    ArtistVO artistVO1=manageArtistService.memIdChk(artistVO);

	    return artistVO1; // 실제 데이터 반환
	}

	//아티스트 생성
	@ResponseBody
	@PostMapping("/createArtistAjax")
	public int createArtistAjax( ArtistVO artistVO ) {
	    log.info("createArtistAjax->artistVO : " + artistVO);
	    int result=manageArtistService.createArtist(artistVO);

	    return result; // 실제 데이터 반환
	}
	
	//아티스트 업데이트
	@ResponseBody
	@PostMapping("/updateArtistAjax")
	public int updateArtistAjax( ArtistVO artistVO ) {
		log.info("updateArtistAjax->artistVO : " + artistVO);
		int result=manageArtistService.updateArtist(artistVO);

		return result; // 실제 데이터 반환
	}

	//아티스트 삭제
	@ResponseBody
	@PostMapping("/deleteArtistAjax")
	public int deleteArtistAjax(@RequestBody ArtistVO artistVO ) {
		log.info("deleteArtistAjax->artistVO : " + artistVO);
		int result=manageArtistService.deleteArtist(artistVO);

		return result; // 실제 데이터 반환
	}
	
	//아티스트 그룹 리스트
	@ResponseBody
	@RequestMapping(value="/artistGroupList",method=RequestMethod.POST)
	public List<GroupsVO> artistGroupList(@RequestBody Map<String,Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
		log.info("artistGroupList->map : " + map);
		List<GroupsVO> groupsVOList=manageArtistService.artistGroupList(map);
		return groupsVOList;

	}
}
