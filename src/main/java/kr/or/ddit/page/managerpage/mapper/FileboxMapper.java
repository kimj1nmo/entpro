package kr.or.ddit.page.managerpage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.GanttVO;
import kr.or.ddit.vo.ProjectFileVO;
import kr.or.ddit.vo.ProjectVO;

@Mapper
public interface FileboxMapper {

	// 파일 불러오기(상위 프로젝트별 파일 불러오기)
	public ProjectVO filebox(int proNo);

	// 파일업로드
	public int updateFileAjax(GanttVO ganttVO);

//	public int detailFile(int proNo);

	// 파일상세
	public int fileboxInfo(GanttVO ganttVO);

	// 파일 불러오기(경로)
	public List<ProjectFileVO> filePath(ProjectFileVO projectFileVO);

	// 파일별 갯수 가져오기 
	public List<GanttVO> fileCount(GanttVO ganttVO);

}
