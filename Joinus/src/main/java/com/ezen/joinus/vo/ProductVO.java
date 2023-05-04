package com.ezen.joinus.vo;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class ProductVO {
    private int storeID;
    private int pno;
    private String p_name;
    private String p_subtitle;
    private String p_content;
    private String p_image;
    private String p_period;
    private String p_category;
}
