package kr.or.ddit.page.companypage.managealbum;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.page.companypage.manageartist.ManageArtistController;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.AlbumVO;
import kr.or.ddit.vo.ArtistVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manageAlbumAjax")
public class ManageAlbumController {


	@Autowired
	ManageAlbumService manageAlbumService;


	@ResponseBody
	@RequestMapping(value="/albumListAjax",method=RequestMethod.POST)
	public ArticlePage<AlbumVO> albumListAjax(@RequestBody Map<String,Object> map) {
		//map{"currentPage":"1","keyword"="도서"}
		log.info("albumListAjax->map : " + map);

		//전체 행의 수 *******
		int total = this.manageAlbumService.getTotal(map);
		log.info("list->total : " + total);

		//map{currentPage=1,keyword=}
		List<AlbumVO> artistVOList = this.manageAlbumService.list(map);
		log.info("list->artistVOList : " + artistVOList);

		//map.get("currentPage") : Object 타입
		int currentPage = Integer.parseInt(map.get("currentPage").toString());//Object->"1"->1
		String keyword = "";
		//검색어가 없을 수 있으므로 처리
		if(map.get("keyword")!=null) {
			keyword = map.get("keyword").toString();//"도서"
		}

		//페이지네이션
		ArticlePage<AlbumVO> articlePage
			= new ArticlePage<AlbumVO>(total, currentPage,
					10, artistVOList, keyword, "ajax");

		return articlePage;
	}
}
