package kr.or.ddit.page.comm.live;

import java.io.Console;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.LiveChatVO;
import kr.or.ddit.vo.LiveLikeVO;
import kr.or.ddit.vo.LiveVO;
import kr.or.ddit.vo.VodVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LiveServiceImpl implements LiveService {


	@Autowired
	LiveMapper liveMapper;
	// UploadController DI/IoC
	@Autowired
	UploadController uploadController;

	//비동기로 방송스트림 키를 발급받는다
	@Override
	public int getKeyNo() {
		return liveMapper.getKeyNo();
	}
	//해당 라이브의번호에 해당맴버가 좋아요를 눌렇는지 체크한다

	@Override
	@Transactional
	public LiveLikeVO getLiveLikeChk(LiveLikeVO liveLikeVO) {
		//해당 라이브의번호에 해당맴버가 좋아요를 눌렀는지 체크한다
		 liveLikeVO = liveMapper.getLiveLikeChk(liveLikeVO);

		return liveLikeVO;
	}
	//해당 라이브 번호에 해당맴버가 좋아요를 눌렀을 떄

	@Override
	public LiveLikeVO setliveLikeAjax(LiveLikeVO liveLikeVO) {
		//해당 라이브의번호에 해당맴버가 좋아요를 눌렀는지 체크한다
		LiveLikeVO liveLikeVO1 = liveMapper.getLiveLikeChk(liveLikeVO);
		log.info("setliveLikeAjax-liveLikeVO1(전) {}",liveLikeVO1);

		int result=liveMapper.liveLikeIns(liveLikeVO);

//		if(liveLikeVO1==null) {
//			//해당 라이브의번호에 해당맴버가 좋아요를 누룬것을 저장
//			int result=liveMapper.liveLikeIns(liveLikeVO);
//			log.info("저장");
//
//		}else {
//			//해당 라이브의번호에 해당맴버가 좋아요를 누룬것을 변경
//			int result=liveMapper.liveLikeChn(liveLikeVO1);
//
//			log.info("변경");
//		}
		return liveLikeVO1;
	}

	//라이브 정보 가져오기
	@Override
	public LiveVO getLiveInfo(HashMap<String, Object> map) {
		return liveMapper.getLiveInfo(map);
	}


	@Override
	public LiveVO getLiveInfo(int streamCode) {
		return liveMapper.getLiveInfo(streamCode);
	}


	//해당 그룹 넘버의 라이브 리스트 가져오기
	@Override
	public List<LiveVO> liveList(int groupNo) {
		return liveMapper.liveList(groupNo);

	}

	@Override
	public List<LiveVO> oldLiveList(int groupNo) {
		return liveMapper.oldLiveList(groupNo);

	}
	@Override
	public List<VodVO> VodList(int groupNo) {
		return liveMapper.VodList(groupNo);
	}
	//이전 채팅 내역 가져오기

	@Override
	public List<LiveChatVO> chatSetAjax(int streamCode) {
		return liveMapper.chatSetAjax(streamCode);
	}
	//새로운 라이브방 만들기
	@Override
	public int createLiveAjax(LiveVO liveVO) {
		log.info("liveVO{}",liveVO);


		//1.다중 파일 업로드 처리(파일 + Db)
				MultipartFile[] uploadFiles = liveVO.getUploadFiles();
				if(uploadFiles !=null && uploadFiles[0].getOriginalFilename().length()>0) {


					long fileGroupNo = this.uploadController.multiImageUpload(uploadFiles);
					log.info("createLiveAjax->fileGroupNo: " + fileGroupNo);

					liveVO.setFileGroupNo(fileGroupNo);
					log.info("createLiveAjax->liveVO: " + liveVO);
				}
				int result =liveMapper.createLiveAjax(liveVO);
				log.info("liveVO 후{}",liveVO);

		liveMapper.createVod(liveVO);
		log.info("liveVO 후{}",liveVO);

		return result;

	}

	@Override
	public int endLiveAjax(LiveVO liveVO) {
		return liveMapper.endLiveAjax(liveVO);

	}
	//썸네일 가져오기
	@Override
	public VodVO getSumnail(HashMap<String, Object> map) {
		return liveMapper.getSumnail(map);

	}
	//해당 그룹의 아티스트인지 확인
	@Override
	public Integer getArtistAuthChk(HashMap<String, Object> map) {
		return liveMapper.getArtistAuthChk(map);
	}

	@Override
	public CommunityVO setCommRegNick(HashMap<String, Object> map) {
		return liveMapper.setCommRegNick(map);

	}

	@Override
	public VodVO getVodInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return liveMapper.getVodInfo(map);
	}
	//아티스트 커뮤니티 세팅
	@Override
	public CommunityVO setArtistSet(HashMap<String, Object> map) {
		return liveMapper.setArtistSet(map);
	}


}
