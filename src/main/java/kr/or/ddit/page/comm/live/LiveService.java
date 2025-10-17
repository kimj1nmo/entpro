package kr.or.ddit.page.comm.live;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.LiveChatVO;
import kr.or.ddit.vo.LiveLikeVO;
import kr.or.ddit.vo.LiveVO;
import kr.or.ddit.vo.VodVO;

public interface LiveService {
	//비동기로 방송스트림 키를 발급받는다

	public int getKeyNo();
	//해당 라이브의번호에 해당맴버가 좋아요를 눌렇는지 체크한다
	public LiveLikeVO getLiveLikeChk(LiveLikeVO liveLikeVO);
	//해당 라이브 번호에 해당맴버가 좋아요를 눌렀을 떄
	public LiveLikeVO setliveLikeAjax(LiveLikeVO liveLikeVO);
	//라이브 정보 가져오기
	public LiveVO getLiveInfo(HashMap<String, Object> map);
	public LiveVO getLiveInfo(int streamCode);
	//해당 그룹 넘버의 라이브 리스트 가져오기
	public List<LiveVO> liveList(int groupNo);
	public List<LiveVO> oldLiveList(int groupNo);
	//해당 그룹 넘버의 vod 리스트 가져오기
	public List<VodVO> VodList(int groupNo);

	//이전 채팅 내역 가져오기
	public List<LiveChatVO> chatSetAjax(int streamCode);
	//새로운 라이브방 만들기
	public int createLiveAjax(LiveVO liveVO);
	//라이브 방송 끝내기

	public int endLiveAjax(LiveVO liveVO);
	//썸네일 가져오기
	public VodVO getSumnail(HashMap<String, Object> map);
	//해당 그룹의 아티스트인지 확인
	public Integer getArtistAuthChk(HashMap<String, Object> map);

	//커뮤니티 이름가져오기
	public CommunityVO setCommRegNick(HashMap<String, Object> map);
	//동영상 정보 가져오기
	public VodVO getVodInfo(HashMap<String, Object> map);
	//아티스트 커뮤니티 세팅
	public CommunityVO setArtistSet(HashMap<String, Object> map);

}
