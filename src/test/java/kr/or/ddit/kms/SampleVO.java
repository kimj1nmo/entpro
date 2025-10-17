package kr.or.ddit.kms;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

public class SampleVO {
	public static void main(String[] args) {
//		String nameA = "수민6";
//		String nameB = "홍길동";
//		String nameC = new String("홍길동");
//		String nameD = new String("수민 6ㅋㅋ");
//
//
//		String name = "홍길동";
//
//		System.out.println(nameA == nameB);
//
//		System.out.println("홍길동".equals(name));
//
//		System.out.println(name == null || name.equals("홍길동"));
//		System.out.println(name == null | name.equals("홍길동"));

		/*
		List<String> lines = new ArrayList<String>();
		for(int i=0; i<100; i++) {
			lines.add("샘플 데이터 생성 라인 " + (i+1)+" 번째");
		}
		String nameF = new String("홍길동");

		File file = new File("e:/temp/filetest.txt");
		try {
			FileUtils.writeLines(file,lines);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		/*
		File file = new File("e:/temp/filetest.txt");
		try {
			List<String> lines = FileUtils.readLines(file, "UTF-8");
			System.out.println("lines.size() : " + lines.size());
			for(String line:lines) {
				System.out.println(line);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		String fullFileName = "c:/Temp/20241221/filetest.txt";

		System.out.println(FilenameUtils.getBaseName(fullFileName));
		System.out.println(FilenameUtils.getExtension(fullFileName));
		System.out.println(FilenameUtils.getPath(fullFileName));
		System.out.println(FilenameUtils.getName(fullFileName));
		System.out.println(FilenameUtils.getPrefix(fullFileName));
		System.out.println(UUID.randomUUID().toString());

		int lineCnt = 5;

		for(int i=0; i<lineCnt+1; i++) {
			for(int k=lineCnt-i;k>0;k--) {
				System.out.println(' ');
			}
			for(int j=0; j<i*2-1; j++) {
				System.out.println("*");
			}
			System.out.println();
		}
	}
}

