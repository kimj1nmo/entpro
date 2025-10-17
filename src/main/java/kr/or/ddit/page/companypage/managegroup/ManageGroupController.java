package kr.or.ddit.page.companypage.managegroup;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.companypage.manageartist.ManageArtistController;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manageGroupAjax")
public class ManageGroupController {

	@Autowired
	ManageGroupService manageGroupService;


	//그룹 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "/groupListSortAjax", method = RequestMethod.POST)
	public ArticlePage<GroupsVO> groupListSortAjax(@RequestBody Map<String, Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
				log.info("groupListSortAjax->map : " + map);

				//전체 행의 수 *******
				int total = this.manageGroupService.getTotal(map);
				log.info("ManageGroupController->groupListSortAjax->total : " + total);

				//map{currentPage=1,keyword=}
				List<GroupsVO> groupsVOList = this.manageGroupService.listSort(map);
				log.info("ManageGroupController->groupListSortAjax->artistVOList : " + groupsVOList);

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
				ArticlePage<GroupsVO> articlePage
					= new ArticlePage<GroupsVO>(total, currentPage,
							10	, groupsVOList, keyword, mode,sortName);

				return articlePage;
	}

	//그룹 생성하기
	@ResponseBody
	@PostMapping("/createGroupAjax")
	public int createGroupAjax( GroupsVO  groupsVO ) {
	    log.info("createArtistAjax->artistVO : " + groupsVO);
	    int result=manageGroupService.createGroup(groupsVO);

	    return result; // 실제 데이터 반환
	}

	//그룹 업데이트
	@ResponseBody
	@PostMapping("/updateGroupAjax")
	public int updateGroupAjax( GroupsVO  groupsVO ) {
		log.info("updateGroupAjax->artistVO : " + groupsVO);
		int result=manageGroupService.updateGroup(groupsVO);

		return result; // 실제 데이터 반환
	}
	//그룹 상세
	@ResponseBody
	@PostMapping("/groupDetailAjax")
	public GroupsVO groupDetailAjax(@RequestBody Map<String, Integer> requestBody) {
		int groupNo = (int) requestBody.get("groupNo"); // JSON에서 groupNo 값을 추출
	    log.info("groupDetailAjax->groupNo : " + groupNo);
	    GroupsVO groupsVO =manageGroupService.groupDetail(groupNo);
	    log.info("groupDetailAjax->groupNo : " + groupsVO);

	    return groupsVO; // 실제 데이터 반환
	}

	//그룹에서 아티스트 제거하기
	@ResponseBody
	@PostMapping("/groupArtistDel")
	public int groupArtistDel(@RequestBody Map<String, Integer> requestBody) {
		int artistNo =  requestBody.get("artistNo"); // JSON에서 groupNo 값을 추출
		int groupNo =  requestBody.get("groupNo"); // JSON에서 groupNo 값을 추출
		Map<String, Integer> map =new HashMap<>();//
		map.put("artistNo",artistNo);
		map.put("groupNo",groupNo);
		log.info("groupDetailAjax->artistNo : " + artistNo);
		int result =manageGroupService.groupArtistDel(map);
//		log.info("groupDetailAjax->artistVO : " + artistVO);

		return result; // 실제 데이터 반환
	}

//	아티스트 검색하기
	@ResponseBody
	@PostMapping("/artistSearch")
	public  List<ArtistVO> artistSearch( @RequestBody ArtistVO  artistVO ) {
	    log.info("createArtistAjax->artistVO : " + artistVO);
	    List<ArtistVO> artistVOs=manageGroupService.artistSearch(artistVO);

	    return artistVOs; // 실제 데이터 반환
	}

	//아티스트 그룹에 넣기
	@ResponseBody
	@PostMapping("/artistInsertGroup")
	public int artistInsertGroup(@RequestBody Map<String, Object> map) {
	    log.info("artistInsertGroup->map : " + map);
	    // 이미 존재하는지 확인
	    int check=manageGroupService.checkArtistExists(map);
	    log.info("check?->check : " + check);
	    if (check==1) {
		    log.info("들어감?->map : " + map);

	        return -1;
	    }

	    // 그룹데이터에 아티스트 추가 하기
	    int result = manageGroupService.artistInsertGroup(map);
	    if (result==1) {
	        return 1;
	    }

	    return 0;
	}
}
