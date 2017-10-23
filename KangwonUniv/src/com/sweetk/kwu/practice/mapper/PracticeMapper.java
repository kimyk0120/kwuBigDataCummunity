package com.sweetk.kwu.practice.mapper;

import java.util.ArrayList;

import com.sweetk.kwu.practice.vo.PracticeVo;

public interface PracticeMapper {
	
	public int practice_list_count(PracticeVo pvo);
	
	public ArrayList<PracticeVo> practice_list(PracticeVo pvo);

}
