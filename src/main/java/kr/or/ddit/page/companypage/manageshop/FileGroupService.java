package kr.or.ddit.page.companypage.manageshop;

import kr.or.ddit.vo.FileGroupVO;
import kr.or.ddit.vo.FileDetailVO;

public interface FileGroupService {
    void insertFileGroup(FileGroupVO fileGroupVO);
    void insertFileDetail(FileDetailVO fileDetailVO);
}
