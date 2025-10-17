package kr.or.ddit.page.companypage.audition;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.AlbumVO;
import kr.or.ddit.vo.AuditionReqstVO;
import kr.or.ddit.vo.AuditionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AuditionServiceImpl implements AuditionService {

	@Autowired
	AuditionMapper auditionMapper;


	// UploadController DI/IoC
	@Autowired
	UploadController uploadController;

	//오디션 신청의 총합을 가져온다
	@Override
	public int getTotal(Map<String, Object> map) {
		return auditionMapper.getTotal(map);
	}

	//오디션리스트를 가져온다

	@Override
	public List<AuditionReqstVO> list(Map<String, Object> map) {
		return auditionMapper.list(map);
	}
	//종료된//종료되지않은 페이지리스트를 가져온다

	@Override
	public List<AuditionVO> getAuditionListFinish(String type) {
		return auditionMapper.getAuditionListFinish(type);
	}

	@Override
	public int getTotalAud(Map<String, Object> map) {
		return auditionMapper.getTotalAud(map);

	}

	@Override
	public List<AuditionVO> listAud(Map<String, Object> map) {
		return auditionMapper.listAud(map);

	}

	@Override
	public AuditionVO audDetail(Map<String, Object> map) {
		return auditionMapper.audDetail(map);
	}

	@Override
	public int createAudition(AuditionVO auditionVO) {
		log.info("createAudition->auditionVO: " + auditionVO);

		//1.다중 파일 업로드 처리(파일 + Db)
		MultipartFile[] uploadFiles = auditionVO.getUploadFiles();
		if(uploadFiles !=null && uploadFiles[0].getOriginalFilename().length()>0) {


			long fileGroupNo = this.uploadController.multiImageUpload(uploadFiles);
			log.info("createAudition->fileGroupNo: " + fileGroupNo);

			auditionVO.setFileGroupNo(fileGroupNo);
			log.info("createAudition->artistVO: " + auditionVO);
		}
		return auditionMapper.createAudition(auditionVO);
		}

	@Override
	public int endAudition(Map<String, Object> map) {
		return auditionMapper.endAudition(map);
	}

	@Override
	public int updateAudition(AuditionVO auditionVO) {
		log.info("updateAudition->auditionVO: " + auditionVO);

		//1.다중 파일 업로드 처리(파일 + Db)
		MultipartFile[] uploadFiles = auditionVO.getUploadFiles();
		if(uploadFiles !=null && uploadFiles[0].getOriginalFilename().length()>0) {


			long fileGroupNo = this.uploadController.multiImageUpload(uploadFiles);
			log.info("updateAudition->fileGroupNo: " + fileGroupNo);

			auditionVO.setFileGroupNo(fileGroupNo);
			log.info("updateAudition->artistVO: " + auditionVO);
		}
		return auditionMapper.updateAudition(auditionVO);
		}

	//오디션 신청 정보 가져오기
	@Override
	public AuditionReqstVO audReqstDetail(Map<String, Object> map) {
		return auditionMapper.audReqstDetail(map);
	}

	@Override
	public int audReqstStateUpt(Map<String, Object> map) {
		return auditionMapper.audReqstStateUpt(map);

	}

	@Override
	public int checkNoRespTotal() {
		return auditionMapper.checkNoRespTotal();

	}

}
