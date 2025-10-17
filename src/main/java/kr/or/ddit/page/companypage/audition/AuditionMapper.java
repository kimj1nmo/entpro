package kr.or.ddit.page.companypage.audition;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AlbumVO;
import kr.or.ddit.vo.AuditionReqstVO;
import kr.or.ddit.vo.AuditionVO;

@Mapper
public interface AuditionMapper {
	// 오디션 신청의 총합을 가져온다
	int getTotal(Map<String, Object> map);

	// 오디션리스트를 가져온다
	List<AuditionReqstVO> list(Map<String, Object> map);

	//종료된//종료되지않은 페이지리스트를 가져온다
	List<AuditionVO> getAuditionListFinish(String type);

	int getTotalAud(Map<String, Object> map);

	List<AuditionVO> listAud(Map<String, Object> map);

	AuditionVO audDetail(Map<String, Object> map);

	int createAudition(AuditionVO auditionVO);

	//오디션 종료하기
	int endAudition(Map<String, Object> map);

	//오디션 변경하기
	int updateAudition(AuditionVO auditionVO);


	//오디션 신청 정보 가져오기
	AuditionReqstVO audReqstDetail(Map<String, Object> map);

	//\audReqstState 변경
	int audReqstStateUpt(Map<String, Object> map);

	// 응답안한 오디션 신청 갯수 종합
	int checkNoRespTotal();
}
