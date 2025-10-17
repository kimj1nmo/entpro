package kr.or.ddit.page.companypage.manageshop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.vo.FileGroupVO;
import kr.or.ddit.mapper.FileGroupMapper;
import kr.or.ddit.vo.FileDetailVO;

@Service
public class FileGroupServiceImpl implements FileGroupService {

    @Autowired
    private FileGroupMapper fileGroupMapper;

    @Override
    public void insertFileGroup(FileGroupVO fileGroupVO) {
        fileGroupMapper.insertFileGroup(fileGroupVO);
    }

    @Override
    public void insertFileDetail(FileDetailVO fileDetailVO) {
        fileGroupMapper.insertFileDetail(fileDetailVO);
    }
}
