package com.sweetk.kwu.common.mapper;

import com.sweetk.kwu.common.vo.CommonVo;

public interface CommonMapper {
	public void user_insert(CommonVo cvo);
	
	public int login_check(CommonVo cvo);
	
	public CommonVo user_info(CommonVo cvo);
	
}
