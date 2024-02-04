package com.itwillbs.c5d2308t1_2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {

	int insertReport(Map<String, String> map);

	List<Map<String, Object>> memberReportList();

	List<Map<String, Object>> boardReportList();
	
}
