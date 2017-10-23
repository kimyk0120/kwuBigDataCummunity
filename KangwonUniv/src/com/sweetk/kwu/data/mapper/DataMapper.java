package com.sweetk.kwu.data.mapper;

import java.util.ArrayList;
import com.sweetk.kwu.data.vo.DataVo;

public interface DataMapper {
	public int info_list_count(DataVo dvo);
	
	public ArrayList<DataVo> info_list(DataVo dvo);
	
	public int info_insert(DataVo dvo);
	
	public DataVo info_detail(int b_no);
	
	public void info_view_count(int b_no);
	
	public void info_file_insert(DataVo dvo);
	
	public ArrayList<DataVo> info_file_list(int b_no);

	public ArrayList<DataVo> info_repl_list(int b_no);
	
	public void info_repl_insert(DataVo dvo);
	
	public void info_update(DataVo dvo);
	public void info_file_delete(DataVo dvo);
}
