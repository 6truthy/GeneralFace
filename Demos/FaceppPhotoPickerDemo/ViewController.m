//
//  ViewController.m
//  FaceppPhotoPickerDemo
//
//  Created by youmu on 12-12-5.
//  Copyright (c) 2012年 Megvii. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"
#import "../APIKey+APISecret.h"
#import "WXApi.h"
@implementation ViewController {
    NSString *currentFaceId;
    int hasStarted;
}
- (void)createPersonWithImage: (NSString*)personName :(NSString*)imageName :(int) sex
{
    UIImage *profile = [UIImage imageNamed:imageName];
        FaceppResult *detectLocalFileResult = [[FaceppAPI detection] detectWithURL:nil
                                                                   orImageData: UIImageJPEGRepresentation(profile, 0.5)];
    if ([detectLocalFileResult success]) {
        int face_count = (int)[[detectLocalFileResult content][@"face"] count];
        if (face_count > 0) {
            NSString* face_id = [detectLocalFileResult content][@"face"][0][@"face_id"];
            [[FaceppAPI person] deleteWithPersonName:personName orPersonId:nil];
            [[FaceppAPI person] createWithPersonName:personName andFaceId:[NSArray arrayWithObjects:face_id,nil] andTag:nil andGroupId:nil orGroupName:nil];
            if (sex == 0) [[FaceppAPI faceset] addFaceWithFacesetName:@"Sidamingzhu_male_ucla_faceset" orFacesetId:nil andFaceId:@[face_id]];
            else [[FaceppAPI faceset] addFaceWithFacesetName:@"Sidamingzhu_female_ucla_faceset" orFacesetId:nil andFaceId:@[face_id]];
        }
    }

}
- (NSString *)getPersonComment:(NSString *)personName
{
    return @"这是个好人！";
}
- (NSArray *)getPersonAttributes:(NSString *)personName
{
    if ([personName  isEqual: @"Zhangfei_ucla"]) return[NSArray arrayWithObjects:@72,@71,@70,@97, nil];
    if ([personName  isEqual: @"Guanyu_ucla"]) return[NSArray arrayWithObjects:@86,@81,@82,@96, nil];
    if ([personName  isEqual: @"Machao_ucla"]) return[NSArray arrayWithObjects:@89,@85,@80,@89, nil];
    if ([personName  isEqual: @"Yuanshao_ucla"]) return[NSArray arrayWithObjects:@78,@89,@78,@72, nil];
    if ([personName  isEqual: @"Xiahouyuan_ucla"]) return[NSArray arrayWithObjects:@77,@82,@80,@82, nil];
    if ([personName  isEqual: @"Xiahoudun_ucla"]) return[NSArray arrayWithObjects:@72,@83,@71,@94, nil];
    if ([personName  isEqual: @"Taishici_ucla"]) return[NSArray arrayWithObjects:@85,@85,@80,@87, nil];
    if ([personName  isEqual: @"Dianwei_ucla"]) return[NSArray arrayWithObjects:@73,@77,@70,@95, nil];
    if ([personName  isEqual: @"Weiyan_ucla"]) return[NSArray arrayWithObjects:@73,@85,@73,@88, nil];
    if ([personName  isEqual: @"Yanyan_ucla"]) return[NSArray arrayWithObjects:@81,@83,@79,@86, nil];
    if ([personName  isEqual: @"Ganning_ucla"]) return[NSArray arrayWithObjects:@90,@78,@77,@88, nil];
    if ([personName  isEqual: @"Guanping_ucla"]) return[NSArray arrayWithObjects:@88,@76,@78,@82, nil];
    if ([personName  isEqual: @"Zhoucang_ucla"]) return[NSArray arrayWithObjects:@77,@76,@75,@85, nil];
    if ([personName  isEqual: @"Caozhang_ucla"]) return[NSArray arrayWithObjects:@81,@82,@78,@81, nil];
    if ([personName  isEqual: @"Zhanghe_ucla"]) return[NSArray arrayWithObjects:@77,@85,@78,@89, nil];
    if ([personName  isEqual: @"Madai_ucla"]) return[NSArray arrayWithObjects:@82,@80,@80,@88, nil];
    if ([personName  isEqual: @"Mateng_ucla"]) return[NSArray arrayWithObjects:@89,@89,@78,@82, nil];
    if ([personName  isEqual: @"Pangde_ucla"]) return[NSArray arrayWithObjects:@90,@83,@84,@88, nil];
    if ([personName  isEqual: @"Lvmeng_ucla"]) return[NSArray arrayWithObjects:@75,@80,@90,@71, nil];
    if ([personName  isEqual: @"Yiji_ucla"]) return[NSArray arrayWithObjects:@72,@74,@86,@70, nil];
    if ([personName  isEqual: @"Yuanshu_ucla"]) return[NSArray arrayWithObjects:@76,@85,@78,@74, nil];
    if ([personName  isEqual: @"Yuanxi_ucla"]) return[NSArray arrayWithObjects:@74,@80,@73,@74, nil];
    if ([personName  isEqual: @"Yuanshang_ucla"]) return[NSArray arrayWithObjects:@75,@80,@74,@73, nil];
    if ([personName  isEqual: @"Yuantan_ucla"]) return[NSArray arrayWithObjects:@75,@80,@73,@92, nil];
    if ([personName  isEqual: @"Liubei_ucla"]) return[NSArray arrayWithObjects:@82,@100,@83,@78, nil];
    if ([personName  isEqual: @"Xuhuang_ucla"]) return[NSArray arrayWithObjects:@77,@85,@81,@89, nil];
    
    if ([personName  isEqual: @"Sunshangxiang_ucla"]) return[NSArray arrayWithObjects:@90,@81,@80,@78, nil];
    if ([personName  isEqual: @"Diaochan_ucla"]) return[NSArray arrayWithObjects:@100,@98,@82,@81, nil];
    if ([personName  isEqual: @"Huangyueying_ucla"]) return[NSArray arrayWithObjects:@82,@84,@90,@90, nil];
    if ([personName  isEqual: @"Daqiao_ucla"]) return[NSArray arrayWithObjects:@92,@91,@90,@77, nil];
    if ([personName  isEqual: @"Zhenji_ucla"]) return[NSArray arrayWithObjects:@88,@91,@82,@83, nil];
    if ([personName  isEqual: @"Wuguotai_ucla"]) return[NSArray arrayWithObjects:@78,@80,@81,@90, nil];
    if ([personName  isEqual: @"Zhurong_ucla"]) return[NSArray arrayWithObjects:@79,@77,@81,@85, nil];
    if ([personName  isEqual: @"Wangyi_ucla"]) return[NSArray arrayWithObjects:@85,@88,@86,@87, nil];
    if ([personName  isEqual: @"Caiyan_ucla"]) return[NSArray arrayWithObjects:@92,@92,@94,@88, nil];
    if ([personName  isEqual: @"Caiwenji_ucla"]) return[NSArray arrayWithObjects:@88,@87,@80,@81, nil];
    if ([personName  isEqual: @"Zhangchunhua_ucla"]) return[NSArray arrayWithObjects:@84,@82,@80,@95, nil];
    if ([personName  isEqual: @"Zoushi_ucla"]) return[NSArray arrayWithObjects:@79,@82,@80,@81, nil];
    
    if ([personName  isEqual: @"Zhugeliang_ucla"]) return[NSArray arrayWithObjects:@88,@91,@100,@72, nil];
    if ([personName  isEqual: @"Guojia_ucla"]) return[NSArray arrayWithObjects:@91,@82,@94,@71, nil];
    if ([personName  isEqual: @"Caocao_ucla"]) return[NSArray arrayWithObjects:@80,@100,@86,@88, nil];
    if ([personName  isEqual: @"Sunjian_ucla"]) return[NSArray arrayWithObjects:@88,@90,@82,@91, nil];
    if ([personName  isEqual: @"Sunce_ucla"]) return[NSArray arrayWithObjects:@86,@90,@77,@92, nil];
    if ([personName  isEqual: @"Sunquan_ucla"]) return[NSArray arrayWithObjects:@84,@96,@87,@82, nil];
    if ([personName  isEqual: @"Jiangwei_ucla"]) return[NSArray arrayWithObjects:@85,@85,@92,@84, nil];
    if ([personName  isEqual: @"Zhouyu_ucla"]) return[NSArray arrayWithObjects:@88,@89,@92,@70, nil];
    if ([personName  isEqual: @"Luxun_ucla"]) return[NSArray arrayWithObjects:@83,@87,@92,@71, nil];
    if ([personName  isEqual: @"Jiaxu_ucla"]) return[NSArray arrayWithObjects:@89,@81,@90,@70, nil];
    if ([personName  isEqual: @"Caozhi_ucla"]) return[NSArray arrayWithObjects:@82,@72,@93,@70, nil];
    if ([personName  isEqual: @"Zhoutai_ucla"]) return[NSArray arrayWithObjects:@72,@74,@74,@93, nil];
    if ([personName  isEqual: @"Simazhao_ucla"]) return[NSArray arrayWithObjects:@77,@76,@88,@72, nil];
    if ([personName  isEqual: @"Maliang_ucla"]) return[NSArray arrayWithObjects:@80,@78,@87,@70, nil];
    if ([personName  isEqual: @"Pangtong_ucla"]) return[NSArray arrayWithObjects:@74,@73,@94,@71, nil];
    if ([personName  isEqual: @"Masu_ucla"]) return[NSArray arrayWithObjects:@89,@80,@87,@76, nil];
    if ([personName  isEqual: @"Liaohua_ucla"]) return[NSArray arrayWithObjects:@79,@80,@80,@86, nil];
    if ([personName  isEqual: @"Lusu_ucla"]) return[NSArray arrayWithObjects:@78,@82,@90,@70, nil];
    if ([personName  isEqual: @"Muludawang_ucla"]) return[NSArray arrayWithObjects:@73,@80,@74,@87, nil];
    
    if ([personName  isEqual: @"Jiatanchun_ucla"]) return[NSArray arrayWithObjects:@90,@92,@94,@88, nil];
    if ([personName  isEqual: @"Wangxifeng_ucla"]) return[NSArray arrayWithObjects:@88,@79,@84,@80, nil];
    if ([personName  isEqual: @"Jiamu_ucla"]) return[NSArray arrayWithObjects:@78,@88,@87,@94, nil];
    if ([personName  isEqual: @"Shixiangyun_ucla"]) return[NSArray arrayWithObjects:@89,@82,@90,@77, nil];
    if ([personName  isEqual: @"Miaoyu_ucla"]) return[NSArray arrayWithObjects:@87,@87,@88,@78, nil];
    if ([personName  isEqual: @"Jiaqiaojie_ucla"]) return[NSArray arrayWithObjects:@82,@85,@84,@88, nil];
    if ([personName  isEqual: @"Liwan_ucla"]) return[NSArray arrayWithObjects:@85,@90,@88,@90, nil];
    if ([personName  isEqual: @"Sheyue_ucla"]) return[NSArray arrayWithObjects:@86,@88,@82,@92, nil];
    if ([personName  isEqual: @"Pinger_ucla"]) return[NSArray arrayWithObjects:@84,@92,@80,@88, nil];
    if ([personName  isEqual: @"Siqi_ucla"]) return[NSArray arrayWithObjects:@84,@80,@80,@77, nil];
    if ([personName  isEqual: @"Yuanyang_ucla"]) return[NSArray arrayWithObjects:@90,@91,@83,@87, nil];
    if ([personName  isEqual: @"Zijuan_ucla"]) return[NSArray arrayWithObjects:@85,@88,@83,@90, nil];
    if ([personName  isEqual: @"Xiangling_ucla"]) return[NSArray arrayWithObjects:@84,@87,@82,@84, nil];
    if ([personName  isEqual: @"Yuchai_ucla"]) return[NSArray arrayWithObjects:@84,@84,@83,@83, nil];
    if ([personName  isEqual: @"Yinger_ucla"]) return[NSArray arrayWithObjects:@81,@87,@88,@89, nil];
    if ([personName  isEqual: @"Youerjie_ucla"]) return[NSArray arrayWithObjects:@82,@86,@81,@80, nil];
    if ([personName  isEqual: @"Yousanjie_ucla"]) return[NSArray arrayWithObjects:@80,@81,@5,@84, nil];
    if ([personName  isEqual: @"Xuebaoqin_ucla"]) return[NSArray arrayWithObjects:@87,@92,@91,@90, nil];
    if ([personName  isEqual: @"Qiutong_ucla"]) return[NSArray arrayWithObjects:@76,@80,@73,@78, nil];
    if ([personName  isEqual: @"Jinchai_ucla"]) return[NSArray arrayWithObjects:@88,@85,@84,@85, nil];
    if ([personName  isEqual: @"Liqi_ucla"]) return[NSArray arrayWithObjects:@89,@87,@83,@84, nil];
    if ([personName  isEqual: @"Liwen_ucla"]) return[NSArray arrayWithObjects:@90,@90,@88,@88, nil];
    if ([personName  isEqual: @"Lindaiyu_ucla"]) return[NSArray arrayWithObjects:@99,@100,@90,@84, nil];
    if ([personName  isEqual: @"Jiabaoyu_ucla"]) return[NSArray arrayWithObjects:@90,@80,@85,@70, nil];
    if ([personName  isEqual: @"Xuebaochai_ucla"]) return[NSArray arrayWithObjects:@90,@92,@90,@88, nil];
    if ([personName  isEqual: @"Qinkeqing_ucla"]) return[NSArray arrayWithObjects:@93,@90,@87,@87, nil];
    if ([personName  isEqual: @"Xiren_ucla"]) return[NSArray arrayWithObjects:@85,@85,@86,@89, nil];
    if ([personName  isEqual: @"Qingwen_ucla"]) return[NSArray arrayWithObjects:@90,@90,@83,@82, nil];
    if ([personName  isEqual: @"Jiayuanchun_ucla"]) return[NSArray arrayWithObjects:@93,@93,@89,@90, nil];
    if ([personName  isEqual: @"Jiayingchun_ucla"]) return[NSArray arrayWithObjects:@90,@87,@81,@84, nil];
    if ([personName  isEqual: @"Jiaxichun_ucla"]) return[NSArray arrayWithObjects:@88,@88,@84,@86, nil];
    
    if ([personName  isEqual: @"Qinliangyu_ucla"]) return[NSArray arrayWithObjects:@88,@80,@90,@95, nil];
    if ([personName  isEqual: @"Lvlinqi_ucla"]) return[NSArray arrayWithObjects:@85,@83,@82,@84, nil];
    if ([personName  isEqual: @"Mayunlu_ucla"]) return[NSArray arrayWithObjects:@82,@81,@85,@88, nil];
    if ([personName  isEqual: @"Huaman_ucla"]) return[NSArray arrayWithObjects:@80,@78,@82,@87, nil];
    if ([personName  isEqual: @"Baosanniang_ucla"]) return[NSArray arrayWithObjects:@89,@83,@88,@87, nil];
    if ([personName  isEqual: @"Xinxianying_ucla"]) return[NSArray arrayWithObjects:@88,@87,@90,@90, nil];
    if ([personName  isEqual: @"Xiaohoulingnv_ucla"]) return[NSArray arrayWithObjects:@82,@87,@81,@81, nil];
    if ([personName  isEqual: @"Sunluban_ucla"]) return[NSArray arrayWithObjects:@80,@82,@81,@89, nil];
    if ([personName  isEqual: @"Sunshi_ucla"]) return[NSArray arrayWithObjects:@90,@87,@88,@90, nil];
    if ([personName  isEqual: @"Liushi_ucla"]) return[NSArray arrayWithObjects:@86,@87,@82,@86, nil];
    if ([personName  isEqual: @"Bianshi_ucla"]) return[NSArray arrayWithObjects:@92,@90,@82,@91, nil];
    if ([personName  isEqual: @"Xushi_ucla"]) return[NSArray arrayWithObjects:@85,@87,@81,@90, nil];
    if ([personName  isEqual: @"Mishi_ucla"]) return[NSArray arrayWithObjects:@89,@89,@83,@84, nil];
    if ([personName  isEqual: @"Jiujianv_ucla"]) return[NSArray arrayWithObjects:@80,@79,@78,@80, nil];
    if ([personName  isEqual: @"Nv_ucla"]) return[NSArray arrayWithObjects:@85,@84,@83,@82, nil];
    if ([personName  isEqual: @"Qiongying_ucla"]) return[NSArray arrayWithObjects:@90,@90,@88,@89, nil];
    if ([personName  isEqual: @"Duansanniang_ucla"]) return[NSArray arrayWithObjects:@83,@75,@83,@81, nil];
    if ([personName  isEqual: @"Lishishi_ucla"]) return[NSArray arrayWithObjects:@94,@92,@83,@90, nil];
    
    
    if ([personName  isEqual: @"Xunyu_ucla"]) return[NSArray arrayWithObjects:@84,@80,@89,@71, nil];
    if ([personName  isEqual: @"Zhangliao_ucla"]) return[NSArray arrayWithObjects:@88,@90,@85,@90, nil];
    if ([personName  isEqual: @"Xiaohe_ucla"]) return[NSArray arrayWithObjects:@82,@85,@92,@72, nil];
    if ([personName  isEqual: @"Wuqi_ucla"]) return[NSArray arrayWithObjects:@83,@92,@95,@80, nil];
    if ([personName  isEqual: @"Lvshang_ucla"]) return[NSArray arrayWithObjects:@85,@90,@97,@74, nil];
    if ([personName  isEqual: @"Baoshuya_ucla"]) return[NSArray arrayWithObjects:@77,@87,@86,@77, nil];
    if ([personName  isEqual: @"Guanyiwu_ucla"]) return[NSArray arrayWithObjects:@80,@90,@90,@80, nil];
    if ([personName  isEqual: @"Zhengchenggong_ucla"]) return[NSArray arrayWithObjects:@90,@98,@90,@90, nil];
    if ([personName  isEqual: @"Weichigong_ucla"]) return[NSArray arrayWithObjects:@82,@85,@95,@80, nil];
    if ([personName  isEqual: @"Qinqiong_ucla"]) return[NSArray arrayWithObjects:@88,@90,@88,@96, nil];
    if ([personName  isEqual: @"Huoqubing_ucla"]) return[NSArray arrayWithObjects:@90,@95,@88,@90, nil];
    if ([personName  isEqual: @"Hanxin_ucla"]) return[NSArray arrayWithObjects:@80,@98,@90,@93, nil];
    if ([personName  isEqual: @"Zhangliang_ucla"]) return[NSArray arrayWithObjects:@88,@88,@95,@78, nil];
    if ([personName  isEqual: @"Liubang_ucla"]) return[NSArray arrayWithObjects:@82,@100,@83,@72, nil];
    if ([personName  isEqual: @"Fanzeng_ucla"]) return[NSArray arrayWithObjects:@85,@84,@95,@71, nil];
    if ([personName  isEqual: @"Mengtian_ucla"]) return[NSArray arrayWithObjects:@88,@92,@84,@90, nil];
    if ([personName  isEqual: @"Yingzheng_ucla"]) return[NSArray arrayWithObjects:@86,@100,@90,@73, nil];
    if ([personName  isEqual: @"Lvbu_ucla"]) return[NSArray arrayWithObjects:@88,@83,@75,@100, nil];
    if ([personName  isEqual: @"Gongsunsheng_ucla"]) return[NSArray arrayWithObjects:@80,@81,@92,@84, nil];
    if ([personName  isEqual: @"Lujunyi_ucla"]) return[NSArray arrayWithObjects:@94,@90,@87,@90, nil];
    if ([personName  isEqual: @"Shiwengong_ucla"]) return[NSArray arrayWithObjects:@86,@88,@81,@86, nil];
    if ([personName  isEqual: @"Shijin_ucla"]) return[NSArray arrayWithObjects:@87,@83,@81,@87, nil];
    if ([personName  isEqual: @"Wuyong_ucla"]) return[NSArray arrayWithObjects:@83,@82,@97,@70, nil];
    if ([personName  isEqual: @"Huyanzhuo_ucla"]) return[NSArray arrayWithObjects:@85,@86,@85,@89, nil];
    if ([personName  isEqual: @"Songjiang_ucla"]) return[NSArray arrayWithObjects:@87,@99,@88,@83, nil];
    if ([personName  isEqual: @"Zhangqing_ucla"]) return[NSArray arrayWithObjects:@90,@81,@78,@86, nil];
    if ([personName  isEqual: @"Zhangshun_ucla"]) return[NSArray arrayWithObjects:@88,@80,@79,@85, nil];
    if ([personName  isEqual: @"Daizong_ucla"]) return[NSArray arrayWithObjects:@88,@80,@78,@85, nil];
    if ([personName  isEqual: @"Chaogai_ucla"]) return[NSArray arrayWithObjects:@90,@95,@87,@88, nil];
    if ([personName  isEqual: @"Zhutong_ucla"]) return[NSArray arrayWithObjects:@82,@85,@80,@87, nil];
    if ([personName  isEqual: @"Liying_ucla"]) return[NSArray arrayWithObjects:@78,@85,@82,@88, nil];
    if ([personName  isEqual: @"Yangjian_ucla"]) return[NSArray arrayWithObjects:@77,@78,@84,@71, nil];
    if ([personName  isEqual: @"Linchong_ucla"]) return[NSArray arrayWithObjects:@88,@88,@84,@89, nil];
    if ([personName  isEqual: @"Chaijin_ucla"]) return[NSArray arrayWithObjects:@85,@90,@81,@72, nil];
    if ([personName  isEqual: @"Luantingyu_ucla"]) return[NSArray arrayWithObjects:@82,@80,@79,@83, nil];
    if ([personName  isEqual: @"Wusong_ucla"]) return[NSArray arrayWithObjects:@90,@85,@81,@91, nil];
    if ([personName  isEqual: @"Yanqing_ucla"]) return[NSArray arrayWithObjects:@90,@81,@80,@85, nil];
    if ([personName  isEqual: @"Wangqing_ucla"]) return[NSArray arrayWithObjects:@81,@85,@79,@82, nil];
    if ([personName  isEqual: @"Tianhu_ucla"]) return[NSArray arrayWithObjects:@72,@83,@78,@82, nil];
    if ([personName  isEqual: @"Shixiu_ucla"]) return[NSArray arrayWithObjects:@84,@81,@79,@84, nil];
    if ([personName  isEqual: @"Muhong_ucla"]) return[NSArray arrayWithObjects:@75,@82,@80,@85, nil];
    if ([personName  isEqual: @"Huarong_ucla"]) return[NSArray arrayWithObjects:@87,@88,@84,@89, nil];
    if ([personName  isEqual: @"Dongping_ucla"]) return[NSArray arrayWithObjects:@84,@82,@83,@88, nil];
    if ([personName  isEqual: @"Xiebao_ucla"]) return[NSArray arrayWithObjects:@77,@81,@78,@84, nil];
    if ([personName  isEqual: @"Ruanxiaoqi_ucla"]) return[NSArray arrayWithObjects:@82,@83,@82,@85, nil];
    if ([personName  isEqual: @"Ruanxiaoer_ucla"]) return[NSArray arrayWithObjects:@85,@84,@82,@86, nil];
    if ([personName  isEqual: @"Leiheng_ucla"]) return[NSArray arrayWithObjects:@81,@86,@84,@87, nil];
    if ([personName  isEqual: @"Gaoqiu_ucla"]) return[NSArray arrayWithObjects:@73,@87,@80,@70, nil];
    if ([personName  isEqual: @"Gaolian_ucla"]) return[NSArray arrayWithObjects:@90,@82,@89,@75, nil];
    if ([personName  isEqual: @"Luzhishen_ucla"]) return[NSArray arrayWithObjects:@85,@84,@80,@90, nil];
    return nil;
}
- (NSString*)getImageName:(NSString*) personName
{
    if ([personName  isEqual: @"Zhangfei_ucla"]) return(@"0001_张飞_1.jpg");
    if ([personName  isEqual: @"Guanyu_ucla"]) return(@"0002_关羽_1.jpg");
    if ([personName  isEqual: @"Machao_ucla"]) return(@"0004_马超_1.jpg");
    if ([personName  isEqual: @"Yuanshao_ucla"]) return(@"0005_袁绍_1.jpg");
    if ([personName  isEqual: @"Xiahouyuan_ucla"]) return(@"0006_夏侯渊_1.jpg");
    if ([personName  isEqual: @"Xiahoudun_ucla"]) return(@"0007_夏侯惇_1.jpg");
    if ([personName  isEqual: @"Taishici_ucla"]) return(@"0022_太史慈_1.jpg");
    if ([personName  isEqual: @"Dianwei_ucla"]) return(@"0013_典韦_1.jpg");
    if ([personName  isEqual: @"Weiyan_ucla"]) return(@"0015_魏延_1.jpg");
    if ([personName  isEqual: @"Yanyan_ucla"]) return(@"0016_严颜_1.jpg");
    if ([personName  isEqual: @"Ganning_ucla"]) return(@"0017_甘宁_1.jpg");
    if ([personName  isEqual: @"Guanping_ucla"]) return(@"0018_关平_1.jpg");
    if ([personName  isEqual: @"Zhoucang_ucla"]) return(@"0020_周仓_1.jpg");
    if ([personName  isEqual: @"Caozhang_ucla"]) return(@"0021_曹彰_1.jpg");
    if ([personName  isEqual: @"Zhanghe_ucla"]) return(@"0025_张郃_1.jpg");
    if ([personName  isEqual: @"Madai_ucla"]) return(@"0026_马岱_1.jpg");
    if ([personName  isEqual: @"Mateng_ucla"]) return(@"0027_马腾_1.jpg");
    if ([personName  isEqual: @"Pangde_ucla"]) return(@"0028_庞德_1.jpg");
    if ([personName  isEqual: @"Lvmeng_ucla"]) return(@"0030_吕蒙_1.jpg");
    if ([personName  isEqual: @"Yiji_ucla"]) return(@"0031_伊籍_1.jpg");
    if ([personName  isEqual: @"Yuanshu_ucla"]) return(@"0032_袁术_1.jpg");
    if ([personName  isEqual: @"Yuanxi_ucla"]) return(@"0033_袁熙_1.jpg");
    if ([personName  isEqual: @"Yuanshang_ucla"]) return(@"0034_袁尚_1.jpg");
    if ([personName  isEqual: @"Yuantan_ucla"]) return(@"0035_袁谭_1.jpg");
    if ([personName  isEqual: @"Liubei_ucla"]) return(@"0036_刘备_1.jpg");
    if ([personName  isEqual: @"Xuhuang_ucla"]) return(@"0037_徐晃_1.jpg");
    
    if ([personName  isEqual: @"Sunshangxiang_ucla"]) return(@"1538_孙尚香_1.jpg");
    if ([personName  isEqual: @"Diaochan_ucla"]) return(@"1566_貂蝉_1.jpg");
    if ([personName  isEqual: @"Huangyueying_ucla"]) return(@"0665_黄月英_1.jpg");
    if ([personName  isEqual: @"Daqiao_ucla"]) return(@"0567_大乔_1.jpg");
    if ([personName  isEqual: @"Zhenji_ucla"]) return(@"0732_甄氏_1.jpg");
    if ([personName  isEqual: @"Wuguotai_ucla"]) return(@"0736_吴国太_1.jpg");
    if ([personName  isEqual: @"Zhurong_ucla"]) return(@"0137_祝融_1.jpg");
    if ([personName  isEqual: @"Wangyi_ucla"]) return(@"0777_王异_1.jpg");
    if ([personName  isEqual: @"Caiyan_ucla"]) return(@"0569_蔡琰_1.jpg");
    if ([personName  isEqual: @"Caiwenji_ucla"]) return(@"0775_蔡氏_1.jpg");
    if ([personName  isEqual: @"Zhangchunhua_ucla"]) return(@"0776_张春华_1.jpg");
    if ([personName  isEqual: @"Zoushi_ucla"]) return(@"0733_邹氏_1.jpg");

    if ([personName  isEqual: @"Zhugeliang_ucla"]) return(@"1045_诸葛亮_1.jpg");
    if ([personName  isEqual: @"Guojia_ucla"]) return(@"0043_郭嘉_1.jpg");
    if ([personName  isEqual: @"Caocao_ucla"]) return(@"0060_曹操_1.jpg");
    if ([personName  isEqual: @"Sunjian_ucla"]) return(@"0062_孙坚_1.jpg");
    if ([personName  isEqual: @"Sunce_ucla"]) return(@"0063_孙策_1.jpg");
    if ([personName  isEqual: @"Sunquan_ucla"]) return(@"0064_孙权_1.jpg");
    if ([personName  isEqual: @"Jiangwei_ucla"]) return(@"0084_姜维_1.jpg");
    if ([personName  isEqual: @"Zhouyu_ucla"]) return(@"0091_周瑜_1.jpg");
    if ([personName  isEqual: @"Luxun_ucla"]) return(@"0117_陆逊_1.jpg");
    if ([personName  isEqual: @"Jiaxu_ucla"]) return(@"0042_贾诩_1.jpg");
    if ([personName  isEqual: @"Caozhi_ucla"]) return(@"0048_曹植_1.jpg");
    if ([personName  isEqual: @"Zhoutai_ucla"]) return(@"0090_周泰_1.jpg");
    if ([personName  isEqual: @"Simazhao_ucla"]) return(@"0089_司马昭_1.jpg");
    if ([personName  isEqual: @"Maliang_ucla"]) return(@"0109_马良_1.jpg");
    if ([personName  isEqual: @"Pangtong_ucla"]) return(@"0114_庞统_1.jpg");
    if ([personName  isEqual: @"Masu_ucla"]) return(@"0108_马谡_1.jpg");
    if ([personName  isEqual: @"Liaohua_ucla"]) return(@"0121_廖化_1.jpg");
    if ([personName  isEqual: @"Lusu_ucla"]) return(@"0123_鲁肃_1.jpg");
    if ([personName  isEqual: @"Muludawang_ucla"]) return(@"0145_木鹿大王_1.jpg");

    if ([personName  isEqual: @"Jiatanchun_ucla"]) return(@"10_贾探春_1.png");
    if ([personName  isEqual: @"Wangxifeng_ucla"]) return(@"11_王熙凤_1.jpg");
    if ([personName  isEqual: @"Jiamu_ucla"]) return(@"12_贾母_1.jpg");
    if ([personName  isEqual: @"Shixiangyun_ucla"]) return(@"13_史湘云_1.png");
    if ([personName  isEqual: @"Miaoyu_ucla"]) return(@"14_妙玉_1.jpg");
    if ([personName  isEqual: @"Jiaqiaojie_ucla"]) return(@"15_贾巧姐_1.png");
    if ([personName  isEqual: @"Liwan_ucla"]) return(@"16_李纨_1.png");
    if ([personName  isEqual: @"Sheyue_ucla"]) return(@"17_麝月_1.png");
    if ([personName  isEqual: @"Pinger_ucla"]) return(@"18_平儿_1.png");
    if ([personName  isEqual: @"Siqi_ucla"]) return(@"19_司棋_1.png");
    if ([personName  isEqual: @"Yuanyang_ucla"]) return(@"20_鸳鸯_1.png");
    if ([personName  isEqual: @"Zijuan_ucla"]) return(@"21_紫鹃_1.png");
    if ([personName  isEqual: @"Xiangling_ucla"]) return(@"22_香菱_1.png");
    if ([personName  isEqual: @"Yuchai_ucla"]) return(@"23_玉钗_1.png");
    if ([personName  isEqual: @"Yinger_ucla"]) return(@"24_莺儿_1.png");
    if ([personName  isEqual: @"Youerjie_ucla"]) return(@"25_尤二姐_1.jpg");
    if ([personName  isEqual: @"Yousanjie_ucla"]) return(@"26_尤三姐_1.png");
    if ([personName  isEqual: @"Xuebaoqin_ucla"]) return(@"27_薛宝琴_1.png");
    if ([personName  isEqual: @"Qiutong_ucla"]) return(@"28_秋桐_1.jpg");
    if ([personName  isEqual: @"Jinchai_ucla"]) return(@"29_金钗_1.png");
    if ([personName  isEqual: @"Liqi_ucla"]) return(@"30_李绮_1.jpg");
    if ([personName  isEqual: @"Liwen_ucla"]) return(@"31_李纹_1.jpg");
    if ([personName  isEqual: @"Lindaiyu_ucla"]) return(@"1_林黛玉_1.jpg");
    if ([personName  isEqual: @"Jiabaoyu_ucla"]) return(@"2_贾宝玉_1.png");
    if ([personName  isEqual: @"Xuebaochai_ucla"]) return(@"3_薛宝钗_1.png");
    if ([personName  isEqual: @"Qinkeqing_ucla"]) return(@"4_秦可卿_1.png");
    if ([personName  isEqual: @"Xiren_ucla"]) return(@"5_袭人_1.jpg");
    if ([personName  isEqual: @"Qingwen_ucla"]) return(@"6_晴雯_1.png");
    if ([personName  isEqual: @"Jiayuanchun_ucla"]) return(@"7_贾元春_1.png");
    if ([personName  isEqual: @"Jiayingchun_ucla"]) return(@"8_贾迎春_1.png");
    if ([personName  isEqual: @"Jiaxichun_ucla"]) return(@"9_贾惜春_1.png");
    
    if ([personName  isEqual: @"Qinliangyu_ucla"]) return(@"0827_秦良玉_1.jpg");
    if ([personName  isEqual: @"Lvlinqi_ucla"]) return(@"0785_吕玲绮_1.jpg");
    if ([personName  isEqual: @"Mayunlu_ucla"]) return(@"0784_马云騄_1.jpg");
    if ([personName  isEqual: @"Huaman_ucla"]) return(@"0783_花鬘_1.jpg");
    if ([personName  isEqual: @"Baosanniang_ucla"]) return(@"0782_鲍三娘_1.jpg");
    if ([personName  isEqual: @"Xinxianying_ucla"]) return(@"0781_辛宪英_1.jpg");
    if ([personName  isEqual: @"Xiaohoulingnv_ucla"]) return(@"0780_夏侯令女_1.jpg");
    if ([personName  isEqual: @"Sunluban_ucla"]) return(@"0779_孙鲁班_1.jpg");
    if ([personName  isEqual: @"Sunshi_ucla"]) return(@"0778_孙氏_1.jpg");
    if ([personName  isEqual: @"Liushi_ucla"]) return(@"0774_刘氏_1.jpg");
    if ([personName  isEqual: @"Bianshi_ucla"]) return(@"0773_卞氏_1.jpg");
    if ([personName  isEqual: @"Xushi_ucla"]) return(@"0772_徐氏_1.jpg");
    if ([personName  isEqual: @"Mishi_ucla"]) return(@"0769_糜氏_1.jpg");
    if ([personName  isEqual: @"Jiujianv_ucla"]) return(@"0763_酒家女_1.jpg");
    if ([personName  isEqual: @"Nv_ucla"]) return(@"0672_女_1.jpg");
    if ([personName  isEqual: @"Qiongying_ucla"]) return(@"_琼英.png");
    if ([personName  isEqual: @"Duansanniang_ucla"]) return(@"_段三娘.jpg");
    if ([personName  isEqual: @"Lishishi_ucla"]) return(@"_李师师.jpg");
    
    
    if ([personName  isEqual: @"Xunyu_ucla"]) return(@"1044_荀彧_1.jpg");
    if ([personName  isEqual: @"Zhangliao_ucla"]) return(@"1014_张辽_1.jpg");
    if ([personName  isEqual: @"Xiaohe_ucla"]) return(@"0833_萧何_1.jpg");
    if ([personName  isEqual: @"Wuqi_ucla"]) return(@"0832_吴起_1.jpg");
    if ([personName  isEqual: @"Lvshang_ucla"]) return(@"0831_吕尚_1.jpg");
    if ([personName  isEqual: @"Baoshuya_ucla"]) return(@"0830_鲍叔牙_1.jpg");
    if ([personName  isEqual: @"Guanyiwu_ucla"]) return(@"0829_管夷吾_1.jpg");
    if ([personName  isEqual: @"Zhengchenggong_ucla"]) return(@"0828_郑成功_1.jpg");
    if ([personName  isEqual: @"Weichigong_ucla"]) return(@"0825_尉迟恭_1.jpg");
    if ([personName  isEqual: @"Qinqiong_ucla"]) return(@"0824_秦琼_1.jpg");
    if ([personName  isEqual: @"Huoqubing_ucla"]) return(@"0819_霍去病_1.jpg");
    if ([personName  isEqual: @"Hanxin_ucla"]) return(@"0817_韩信_1.jpg");
    if ([personName  isEqual: @"Zhangliang_ucla"]) return(@"0816_张良_1.jpg");
    if ([personName  isEqual: @"Liubang_ucla"]) return(@"0815_刘邦_1.jpg");
    if ([personName  isEqual: @"Fanzeng_ucla"]) return(@"0813_范增_1.jpg");
    if ([personName  isEqual: @"Mengtian_ucla"]) return(@"0811_蒙恬_1.jpg");
    if ([personName  isEqual: @"Yingzheng_ucla"]) return(@"0808_赢政_1.jpg");
    if ([personName  isEqual: @"Lvbu_ucla"]) return(@"1003_吕布_1.jpg");
    if ([personName  isEqual: @"Gongsunsheng_ucla"]) return(@"_公孙胜.png");
    if ([personName  isEqual: @"Lujunyi_ucla"]) return(@"_卢俊义.png");
    if ([personName  isEqual: @"Shiwengong_ucla"]) return(@"_史文恭.png");
    if ([personName  isEqual: @"Shijin_ucla"]) return(@"_史进.png");
    if ([personName  isEqual: @"Wuyong_ucla"]) return(@"_吴用.png");
    if ([personName  isEqual: @"Huyanzhuo_ucla"]) return(@"_呼延灼.png");
    if ([personName  isEqual: @"Songjiang_ucla"]) return(@"_宋江.png");
    if ([personName  isEqual: @"Zhangqing_ucla"]) return(@"_张清.png");
    if ([personName  isEqual: @"Zhangshun_ucla"]) return(@"_张顺.png");
    if ([personName  isEqual: @"Daizong_ucla"]) return(@"_戴宗.png");
    if ([personName  isEqual: @"Chaogai_ucla"]) return(@"_晁盖.png");
    if ([personName  isEqual: @"Zhutong_ucla"]) return(@"_朱仝.png");
    if ([personName  isEqual: @"Liying_ucla"]) return(@"_李应.png");
    if ([personName  isEqual: @"Yangjian_ucla"]) return(@"_杨戬.png");
    if ([personName  isEqual: @"Linchong_ucla"]) return(@"_林冲.png");
    if ([personName  isEqual: @"Chaijin_ucla"]) return(@"_柴进.png");
    if ([personName  isEqual: @"Luantingyu_ucla"]) return(@"_栾廷玉.png");
    if ([personName  isEqual: @"Wusong_ucla"]) return(@"_武松.png");
    if ([personName  isEqual: @"Yanqing_ucla"]) return(@"_燕青.png");
    if ([personName  isEqual: @"Wangqing_ucla"]) return(@"_王庆.png");
    if ([personName  isEqual: @"Tianhu_ucla"]) return(@"_田虎.png");
    if ([personName  isEqual: @"Shixiu_ucla"]) return(@"_石秀.png");
    if ([personName  isEqual: @"Muhong_ucla"]) return(@"_穆弘.png");
    if ([personName  isEqual: @"Huarong_ucla"]) return(@"_花容.png");
    if ([personName  isEqual: @"Dongping_ucla"]) return(@"_董平.png");
    if ([personName  isEqual: @"Xiebao_ucla"]) return(@"_解宝.png");
    if ([personName  isEqual: @"Ruanxiaoqi_ucla"]) return(@"_阮小七.png");
    if ([personName  isEqual: @"Ruanxiaoer_ucla"]) return(@"_阮小二.png");
    if ([personName  isEqual: @"Leiheng_ucla"]) return(@"_雷横.png");
    if ([personName  isEqual: @"Gaoqiu_ucla"]) return(@"_高俅.png");
    if ([personName  isEqual: @"Gaolian_ucla"]) return(@"_高廉.png");
    if ([personName  isEqual: @"Luzhishen_ucla"]) return(@"_鲁智深.png");
    return nil;
}
- (void)createPersonInTheArray:(NSArray*) personName :(int) sex
{
    for (int i = 0; i <[personName count]; i++) {
        NSString* name = [personName objectAtIndex:i];
        [self createPersonWithImage:name :[self getImageName:name] :sex];
    }
}
- (void)viewDidLayoutSubviews
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    UIImageView *startupImageView = [[UIImageView alloc] initWithFrame:screenRect];
    int heightOffset50 = (double)50 / 568 * screenRect.size.height;
    int heightOffset15 = (double)15 / 568 * screenRect.size.height;
    int heightOffset70 = (double)70 / 568 * screenRect.size.height;
    int heightOffset30 = (double)30 / 568 * screenRect.size.height;
    int widthOffset10 = (double)10 / 320 * screenRect.size.width;
    int widthOffset80 = (double)80 / 320 * screenRect.size.width;
    int widthOffset50 = (double)50 / 320 * screenRect.size.width;
    int widthOffset90 = (double)90 / 320 * screenRect.size.width;
    int widthOffset60 = (double)60 / 320 * screenRect.size.width;
    self.startImageView.frame = screenRect;
    self.startImageView.alpha = 0.4;
    self.startImageView.image = [UIImage imageNamed:@"Loading.jpg"];
    self.startButton.frame = CGRectMake(screenRect.size.width / 4, screenRect.size.height / 3 * 2 - heightOffset50, screenRect.size.width / 2, screenRect.size.height / 10); //
    self.startButton.titleLabel.textColor = [UIColor whiteColor]; //
    self.instructionButton.frame = CGRectMake(screenRect.size.width / 4, screenRect.size.height / 3 * 2 + heightOffset15, screenRect.size.width / 2, screenRect.size.height / 10); //
    self.instructionButton.titleLabel.textColor = [UIColor whiteColor]; //
    self.wood2.frame = CGRectMake(screenRect.size.width / 4, screenRect.size.height / 3 * 2 - heightOffset70, screenRect.size.width / 2, screenRect.size.height / 4); //
    self.wood2.image = [UIImage imageNamed:@"Two_wood_boards.png"]; //
    self.wood1.frame = CGRectMake(screenRect.size.width / 4, screenRect.size.height / 8, screenRect.size.width / 2, screenRect.size.height / 4); //
    self.wood1.image = [UIImage imageNamed:@"Wood_board.png"];
    self.myTitle.text = @"大兵小将";
    self.myTitle.textColor = [UIColor whiteColor];
    [self.myTitle setFont:[UIFont fontWithName:@"Heiti TC" size:32]];
    self.myTitle.frame = CGRectMake(screenRect.size.width / 4 + widthOffset10, screenRect.size.height / 8 + heightOffset30, screenRect.size.width / 2, screenRect.size.height / 6);
    self.scrollView.frame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height - 50);
    [self.scrollView setContentSize:CGSizeMake(screenRect.size.width, screenRect.size.height * 2)];
    self.scrollView.hidden = NO;
    self.Original.frame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.width * 4 / 3);
    self.myFrame.frame = CGRectMake(0, screenRect.size.height, screenRect.size.width, screenRect.size.height - 50);
    self.myFrame.image = [UIImage imageNamed:@"surface.png"];
    self.Sanguo.frame = CGRectMake(widthOffset50, screenRect.size.height + heightOffset30, screenRect.size.width - widthOffset50, screenRect.size.width - widthOffset50);
    self.talk.frame = CGRectMake(widthOffset50, screenRect.size.height + screenRect.size.width - widthOffset90, screenRect.size.width - widthOffset50, screenRect.size.height - screenRect.size.width + widthOffset80);
    self.repickButton.frame = CGRectMake(0, screenRect.size.height - 50, 50, 50);
    self.shareButton.frame = CGRectMake(screenRect.size.width - 60, screenRect.size.height - 60, 60, 60);
    
    self.scrollButton.frame = CGRectMake(screenRect.size.width / 2 - widthOffset60, screenRect.size.height - heightOffset50 - heightOffset50, 2 * widthOffset60, heightOffset30);
    self.instructionImage.frame = CGRectMake(0, screenRect.size.height, 320, 480);
}
- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (hasStarted) {
        [UIView animateWithDuration:1.0f animations:^{
            self.instructionImage.frame = CGRectMake(0, screenRect.size.height, 320, 480);
        }];
        hasStarted = 0;
        self.startButton.enabled = YES;
        self.instructionButton.enabled = YES;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:gr];
    hasStarted = 0;
    imagePicker = [[UIImagePickerController alloc] init];
    // initialize
    NSString *API_KEY = _API_KEY;
    NSString *API_SECRET = _API_SECRET;
//    [FaceppAPI initWithApiKey:API_KEY andApiSecret:API_SECRET andRegion:APIServerRegionUS];
    [FaceppAPI initWithApiKey:API_KEY andApiSecret:API_SECRET andRegion:APIServerRegionCN];
    // turn on the debug mode
    [FaceppAPI setDebugMode:TRUE];
    /*
    NSArray *maleGroup = [NSArray arrayWithObjects:@"Zhangfei_ucla",@"Guanyu_ucla",@"Machao_ucla",@"Yuanshao_ucla",@"Xiahouyuan_ucla",@"Xiahoudun_ucla",@"Taishici_ucla",@"Dianwei_ucla",@"Yanyan_ucla",@"Ganning_ucla",@"Guanping_ucla",@"Zhoucang_ucla",@"Caozhang_ucla",@"Zhanghe_ucla",@"Madai_ucla",@"Mateng_ucla",@"Pangde_ucla",@"Lvmeng_ucla",@"Yiji_ucla",@"Yuanshu_ucla",@"Yuanxi_ucla",@"Yuanshang_ucla",@"Yuantan_ucla",@"Liubei_ucla",@"Xuhuang_ucla",@"Zhugeliang_ucla",@"Guojia_ucla",@"Caocao_ucla",@"Sunjian_ucla",@"Sunce_ucla",@"Sunquan_ucla",@"Jiangwei_ucla",@"Zhouyu_ucla",@"Luxun_ucla",@"Jiaxu_ucla",@"Caozhi_ucla",@"Zhoutai_ucla",@"Simazhao_ucla",@"Maliang_ucla",@"Pangtong_ucla",@"Masu_ucla",@"Liaohua_ucla",@"Lusu_ucla",@"Muludawang_ucla",@"Jiabaoyu_ucla",@"Xunyu_ucla",@"Zhangliao_ucla",@"Lvbu_ucla",@"Xiaohe_ucla",@"Wuqi_ucla",@"Lvshang_ucla",@"Baoshuya_ucla",@"Guanyiwu_ucla",@"Zhengchenggong_ucla",@"Weichigong_ucla",@"Qinqiong_ucla",@"Huoqubing_ucla",@"Hanxin_ucla",@"Zhangliang_ucla",@"Liubang_ucla",@"Fanzeng_ucla",@"Mengtian_ucla",@"Yingzheng_ucla",@"Gongsunsheng_ucla",@"Lujunyi_ucla",@"Shiwengong_ucla",@"Shijin_ucla",@"Wuyong_ucla",@"Huyanzhuo_ucla",@"Songjiang_ucla",@"Zhangqing_ucla",@"Zhangshun_ucla",@"Daizong_ucla",@"Chaogai_ucla",@"Zhutong_ucla",@"Liying_ucla",@"Yangjian_ucla",@"Linchong_ucla",@"Chaijin_ucla",@"Luantingyu_ucla",@"Wusong_ucla",@"Yanqing_ucla",@"Wangqing_ucla",@"Tianhu_ucla",@"Shixiu_ucla",@"Muhong_ucla",@"Huarong_ucla",@"Dongping_ucla",@"Xiebao_ucla",@"Ruanxiaoqi_ucla",@"Ruanxiaoer_ucla",@"Leiheng_ucla",@"Gaoqiu_ucla",@"Gaolian_ucla",@"Luzhishen_ucla",nil];
    NSLog(@"%lu\n",(unsigned long)[maleGroup count]);
    NSArray *femaleGroup = [NSArray arrayWithObjects: @"Sunshangxiang_ucla",@"Diaochan_ucla",@"Huangyueying_ucla",@"Daqiao_ucla",@"Zhenji_ucla",@"Wuguotai_ucla",@"Zhurong_ucla",@"Wangyi_ucla",@"Caiyan_ucla",@"Caiwenji_ucla",@"Zhangchunhua_ucla",@"Zoushi_ucla",@"Jiatanchun_ucla",@"Wangxifeng_ucla",@"Jiamu_ucla",@"Shixiangyun_ucla",@"Miaoyu_ucla",@"Jiaqiaojie_ucla",@"Liwan_ucla",@"Sheyue_ucla",@"Pinger_ucla",@"Siqi_ucla",@"Yuanyang_ucla",@"Zijuan_ucla",@"Xiangling_ucla",@"Yuchai_ucla",@"Yinger_ucla",@"Youerjie_ucla",@"Yousanjie_ucla",@"Xuebaoqin_ucla",@"Qiutong_ucla",@"Jinchai_ucla",@"Liqi_ucla",@"Liwen_ucla",@"Lindaiyu_ucla",@"Xuebaochai_ucla",@"Qinkeqing_ucla",@"Xiren_ucla",@"Qingwen_ucla",@"Jiayuanchun_ucla",@"Jiayingchun_ucla",@"Jiaxichun_ucla",@"Qinliangyu_ucla",@"Lvlinqi_ucla",@"Mayunlu_ucla",@"Huaman_ucla",@"Baosanniang_ucla",@"Xinxianying_ucla",@"Xiaohoulingnv_ucla",@"Sunluban_ucla",@"Sunshi_ucla",@"Liushi_ucla",@"Bianshi_ucla",@"Xushi_ucla",@"Mishi_ucla",@"Jiujianv_ucla",@"Nv_ucla",@"Qiongying_ucla",@"Duansanniang_ucla",@"Lishishi_ucla",nil];
    NSLog(@"%lu\n",(unsigned long)[femaleGroup count]);
    FaceppResult *facesetDeleteResult = [[FaceppAPI faceset] deleteWithFacesetName:@"Sidamingzhu_male_ucla_faceset" orFacesetId:nil];
    FaceppResult *facesetCreationResult = [[FaceppAPI faceset] createWithFacesetName:@"Sidamingzhu_male_ucla_faceset" andFaceId:nil andTag:nil];
    facesetDeleteResult = [[FaceppAPI faceset] deleteWithFacesetName:@"Sidamingzhu_female_ucla_faceset" orFacesetId:nil];
    facesetCreationResult = [[FaceppAPI faceset] createWithFacesetName:@"Sidamingzhu_female_ucla_faceset" andFaceId:nil andTag:nil];
    [self createPersonInTheArray:maleGroup :0];
    [self createPersonInTheArray:femaleGroup :1];
    [[FaceppAPI train] trainSynchronouslyWithId:nil orName:@"Sidamingzhu_male_ucla_faceset" andType:FaceppTrainSearch refreshDuration:1.0f timeout:10.0f];
    [[FaceppAPI train] trainSynchronouslyWithId:nil orName:@"Sidamingzhu_female_ucla_faceset" andType:FaceppTrainSearch refreshDuration:1.0f timeout:10.0f];
*/

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)pickFromCameraButtonPressed:(id)sender {
    self.startImageView.hidden = YES;
    self.myTitle.hidden = YES;
    self.wood1.hidden = YES;
    self.wood2.hidden = YES;
    self.startButton.hidden = YES;
    self.instructionButton.hidden = YES;
    self.repickButton.hidden = NO;
    self.shareButton.hidden = NO;
    self.myFrame.hidden = NO;
    UIAlertView *startAlert = [[UIAlertView alloc] initWithTitle:@"亲，来张自拍！"
                                                    message:@"请尽量保持表情中立，测出来才准喔！"
                                                   delegate:nil
                                          cancelButtonTitle:@"好的么么哒"
                                          otherButtonTitles:nil];
    [startAlert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
    [startAlert release];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        imagePicker.videoQuality = UIImagePickerControllerQualityType640x480;
        [self presentViewController:imagePicker animated:YES completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"呀！调用摄像头失败了！"
                              message:@"您的前置摄像头有问题，请检查后再使用"
                              delegate:nil
                              cancelButtonTitle:@"OK!"
                              otherButtonTitles:nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
        [alert release];
    }
}

- (IBAction)repick:(id)sender {
    [self.scrollView setContentOffset:CGPointZero];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    imagePicker.videoQuality = UIImagePickerControllerQualityType640x480;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (UIImage *)fixOrientation:(UIImage *)aImage
{
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

-(void) detectWithImage: (UIImage*) image {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    FaceppResult *result = [[FaceppAPI detection] detectWithURL:nil orImageData:UIImageJPEGRepresentation(image, 0.5) mode:FaceppDetectionModeNormal attribute:FaceppDetectionAttributeGender];
    if (result.success) {
        
        
        double image_width = [[result content][@"img_width"] doubleValue] *0.01f;
        UIGraphicsBeginImageContext(image.size);
        [image drawAtPoint:CGPointZero];
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor(context, 0, 0, 1.0, 1.0);
        CGContextSetLineWidth(context, image_width * 0.7f);
        NSUInteger face_count = [[result content][@"face"] count];
        if (face_count > 0) {
            currentFaceId = [result content][@"face"][0][@"face_id"];
        }
        if (face_count > 1) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"哎呀呀"
                                                            message:@"您的镜头里太多人人家都分辨不过来啦！"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
            [alert release];
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
        else if (face_count == 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"呜呜"
                                                            message:@"我居然没在镜头里看到脸，不如您再试一次吧！"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
            [alert release];
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
        else {
        NSString *info;
        NSString *name = @"";
        for (int i=0; i<face_count; i++) {
//            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            // Load the saved defaults
            BOOL hasMatch = NO;
            NSString *gender = @"";
//            NSMutableDictionary *personId2Name = [[NSMutableDictionary alloc] init];
//            NSMutableDictionary *personId2Gender = [[NSMutableDictionary alloc] init];
//            if ([defaults valueForKey:@"personName"] != nil) personId2Name = [[defaults objectForKey:@"personName"] mutableCopy];
//            if ([defaults valueForKey:@"personGender"] != nil) personId2Gender = [[defaults objectForKey:@"personGender"] mutableCopy];
//            for (NSString *key in personId2Name) {
//                FaceppResult *verifyResult = [[FaceppAPI recognition] verifyWithFaceId:currentFaceId andPersonId:key orPersonName:nil async:NO];
//                if ([[verifyResult content][@"is_same_person"] boolValue]) {
//                    name = [personId2Name objectForKey:key];
//                    gender = [personId2Gender objectForKey:key];
//                    hasMatch = YES;
//                    break;
//                }
//            }
            if (!hasMatch) {
                gender = [result content][@"face"][i][@"attribute"][@"gender"][@"value"];
                FaceppResult *verifyResult;
                if ([gender isEqualToString:@"Male"]) {
                    verifyResult = [[FaceppAPI recognition] searchWithKeyFaceId:currentFaceId andFacesetId:nil orFacesetName:@"Sidamingzhu_male_ucla_faceset" andCount:@1 async:NO];
                }
                else {
                    verifyResult = [[FaceppAPI recognition] searchWithKeyFaceId:currentFaceId andFacesetId:nil orFacesetName:@"Sidamingzhu_female_ucla_faceset" andCount:@1 async:NO];
                }
                NSString* returnFaceId = [verifyResult content][@"candidate"][0][@"face_id"];
                FaceppResult *returnResult = [[FaceppAPI info] getFaceWithFaceId:returnFaceId];
                name = [returnResult content][@"face_info"][0][@"person"][0][@"person_name"];
//                FaceppResult *personCreateResult = [[FaceppAPI person] createWithPersonName:nil andFaceId:[NSArray arrayWithObjects:currentFaceId, nil] andTag:nil andGroupId:nil orGroupName:nil];
//                [[FaceppAPI train] trainSynchronouslyWithId:[personCreateResult content][@"person_id"] orName:nil andType:FaceppTrainVerify refreshDuration:1.0f timeout:10.0f];
//                [personId2Name setObject:name forKey:[personCreateResult content][@"person_id"]];
//                [personId2Gender setObject:gender forKey:[personCreateResult content][@"person_id"]];
//                NSDictionary *name2Save = [[NSDictionary alloc] initWithDictionary:personId2Name];
//                NSDictionary *gender2Save = [[NSDictionary alloc] initWithDictionary:personId2Gender];
//                [defaults setObject:name2Save forKey:@"personName"];
//                [defaults setObject:gender2Save forKey:@"personGender"];
//                [defaults synchronize];
            }
            NSString* chinese;
            NSArray* splitName;
            splitName = [[self getImageName:name] componentsSeparatedByString:@"_"];
            chinese = splitName[1];
            if ([chinese isEqualToString:@"女"]) chinese = @"平凡女子";
            if ([chinese isEqualToString:@"酒家女"]) chinese = @"平凡女子";
            NSArray *attributes = [self getPersonAttributes:name];
            NSString *comment1 = @"", *comment2 = @"", *comment3 = @"", *comment4 = @"";// = [self getPersonComment:name];
            self.scrollButton.hidden = NO;
            if ([gender isEqualToString:@"Male"]) {
                //颜值
                if ([attributes[0] intValue] >= 95)
                    comment1 = @"颜值爆表！有星探找过你吗？";
                else if ([attributes[0] intValue] >= 90)
                    comment1 = @"身边人眼中的大帅哥！校草班草至少的吧！";
                else if ([attributes[0] intValue] >= 85)
                    comment1 = @"在看脸的时代永远不会吃亏。";
                else if ([attributes[0] intValue] >= 80)
                    comment1 = @"颜值还算不错。";
                //领袖
                if ([attributes[1] intValue] >= 95)
                    comment2 = @"天生领袖！必有一番大事业！";
                else if ([attributes[1] intValue] >= 90)
                    comment2 = @"浓厚的领袖气质，很有大将军的风范！";
                else if ([attributes[1] intValue] >= 85)
                    comment2 = @"有一定的领导能力，可以好好发掘。";
                else if ([attributes[1] intValue] >= 80)
                    comment2 = @"能当一个称职的领袖。";
                //智慧
                if ([attributes[2] intValue] >= 95)
                    comment3 = @"智商超群，功成名就指日可待！";
                else if ([attributes[2] intValue] >= 90)
                    comment3 = @"智商碾压身边人，绝对的聪明人！";
                else if ([attributes[2] intValue] >= 85)
                    comment3 = @"IQ高于平均值，无论做什么都如鱼得水。";
                else if ([attributes[2] intValue] >= 80)
                    comment3 = @"智商还算不错。";
                //勇武
                if ([attributes[3] intValue] >= 95)
                    comment4 = @"无敌战神，万军之中取敌上将首级！";
                else if ([attributes[3] intValue] >= 90)
                    comment4 = @"勇武过人，请受众人一拜！";
                else if ([attributes[3] intValue] >= 85)
                    comment4 = @"勇猛善战，一员虎将！";
                else if ([attributes[3] intValue] >= 80)
                    comment4 = @"战斗力尚可。";
                if ([comment1 isEqualToString:@""] && [comment2 isEqualToString:@""] && [comment3 isEqualToString:@""] && [comment4 isEqualToString:@""]) {
                    comment1 = @"“我曾经像你像他像那野草野花，直到看见平凡才是唯一的答案。”";
                }
                info = [NSString stringWithFormat:@"%@脸\n颜值：%@\t领袖：%@\n智慧：%@\t勇武：%@\n%@%@%@%@",chinese,attributes[0],attributes[1],attributes[2],attributes[3],comment1,comment2,comment3,comment4];
            }
            else {
                //颜值
                if ([attributes[0] intValue] >= 95)
                    comment1 = @"颜值倾城倾国，美得不可方物。";
                else if ([attributes[0] intValue] >= 90)
                    comment1 = @"沉鱼落雁，闭月羞花。";
                else if ([attributes[0] intValue] >= 85)
                    comment1 = @"大家心目中的美女。";
                else if ([attributes[0] intValue] >= 80)
                    comment1 = @"颜值还算不错。";
                //温婉
                if ([attributes[1] intValue] >= 95)
                    comment2 = @"柔情似水，无数男子为你心动。";
                else if ([attributes[1] intValue] >= 90)
                    comment2 = @"温情脉脉，一颦一蹙尽态极妍。";
                else if ([attributes[1] intValue] >= 85)
                    comment2 = @"温柔端庄，仪态万端。";
                else if ([attributes[1] intValue] >= 80)
                    comment2 = @"女汉子吧！";
                //才华
                if ([attributes[2] intValue] >= 95)
                    comment3 = @"冰雪聪明风华绝代，巾帼不让须眉！";
                else if ([attributes[2] intValue] >= 90)
                    comment3 = @"冰雪聪明风华绝代，巾帼不让须眉！";
                else if ([attributes[2] intValue] >= 85)
                    comment3 = @"秀外慧中，才华横溢！";
                else if ([attributes[2] intValue] >= 80)
                    comment3 = @"女子无才便是德！";
                //命运
                if ([attributes[3] intValue] >= 95)
                    comment4 = @"上帝宠儿，简直心想事成。";
                else if ([attributes[3] intValue] >= 90)
                    comment4 = @"福星高照，一生幸福美满。";
                else if ([attributes[3] intValue] >= 85)
                    comment4 = @"安稳美满，平凡是福。";
                else if ([attributes[3] intValue] >= 80)
                    comment4 = @"安稳美满，平凡是福。";
                if ([comment1 isEqualToString:@""] && [comment2 isEqualToString:@""] && [comment3 isEqualToString:@""] && [comment4 isEqualToString:@""]) {
                    comment1 = @"“我曾经像你像他像那野草野花，直到看见平凡才是唯一的答案。”";
                }
                info = [NSString stringWithFormat:@"%@脸\n颜值：%@\t温婉：%@\n才华：%@\t命运：%@\n%@%@%@%@",chinese,attributes[0],attributes[1],attributes[2],attributes[3],comment1,comment2,comment3,comment4];
            }
            
//            imageToSend = [self getImageName:name];

            
        }
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        float scale = 1.0f;
        scale = MIN(scale, 280.0f/newImage.size.width);
        scale = MIN(scale, 257.0f/newImage.size.height);
        [imageView setFrame:CGRectMake(imageView.frame.origin.x,
                                       imageView.frame.origin.y,
                                       newImage.size.width * scale,
                                       newImage.size.height * scale)];
        self.talk.text = info;
        self.Sanguo.image = [UIImage imageNamed:[self getImageName:name]];
        self.Original.image = newImage;

            UIImage *image1, *image2, *croppedImage1, *croppedImage2;
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            UIGraphicsBeginImageContext(_scrollView.contentSize);
            {
                CGPoint savedContentOffset = _scrollView.contentOffset;
                CGRect savedFrame = _scrollView.frame;
                
                _scrollView.contentOffset = CGPointMake(0, 0);
                _scrollView.frame = CGRectMake(0, 0, _scrollView.contentSize.width, screenRect.size.height);
                
                [_scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
                image1 = UIGraphicsGetImageFromCurrentImageContext();
                
                _scrollView.contentOffset = savedContentOffset;
                _scrollView.frame = savedFrame;
            }
            UIGraphicsEndImageContext();
            CGImageRef imageRef = CGImageCreateWithImageInRect([image1 CGImage], CGRectMake(0, 0, screenRect.size.width, screenRect.size.width * 4 / 3));
            croppedImage1 = [UIImage imageWithCGImage:imageRef];
            
            UIGraphicsBeginImageContext(_scrollView.contentSize);
            {
                CGPoint savedContentOffset = _scrollView.contentOffset;
                CGRect savedFrame = _scrollView.frame;
                
                _scrollView.contentOffset = CGPointMake(0, screenRect.size.height);
                _scrollView.frame = CGRectMake(0, screenRect.size.height, _scrollView.contentSize.width, screenRect.size.height);
                
                [_scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
                image2 = UIGraphicsGetImageFromCurrentImageContext();
                
                _scrollView.contentOffset = savedContentOffset;
                _scrollView.frame = savedFrame;
            }
            UIGraphicsEndImageContext();
            
            imageRef = CGImageCreateWithImageInRect([image2 CGImage], CGRectMake(0, screenRect.size.height, screenRect.size.width, screenRect.size.height));
            croppedImage2 = [UIImage imageWithCGImage:imageRef];
            CGImageRelease(imageRef);
            
            CGSize size = CGSizeMake(croppedImage1.size.width, croppedImage1.size.height + croppedImage2.size.height);
            
            UIGraphicsBeginImageContext(size);
            
            [croppedImage1 drawInRect:CGRectMake(0,0,size.width, croppedImage1.size.height)];
            [croppedImage2 drawInRect:CGRectMake(0,croppedImage1.size.height,size.width, croppedImage2.size.height)];
            
            self.imageToSend = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();

        }
    } else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"出错啦"
                              message:@"服务器连接失败，请稍后再试。"
                              delegate:nil
                              cancelButtonTitle:@"OK!"
                              otherButtonTitles:nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
        [alert release];
    }
    [image release];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [pool release];
}

- (IBAction)scrollButtonPressed:(id)sender {
    [self.scrollView setContentOffset:CGPointMake(0, [[UIScreen mainScreen] bounds].size.height) animated:YES];
}

- (IBAction)wechatPressed:(id)sender {


    WXMediaMessage *message = [WXMediaMessage message];
    WXImageObject *ext = [WXImageObject object];
    ext.imageData = UIImageJPEGRepresentation(self.imageToSend, 1.0);
    message.mediaObject = ext;
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneTimeline;
    [WXApi sendReq:req];
}

- (IBAction)instructionButtonPressed:(id)sender {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    hasStarted = 1;
    self.startButton.enabled = NO;
    self.instructionButton.enabled = NO;
    [UIView animateWithDuration:1.0f animations:^{
        self.instructionImage.frame = CGRectMake((screenRect.size.width - 320) / 2, (screenRect.size.height - 480) / 2, 320, 480);
    }];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    UIImage *sourceImage = info[UIImagePickerControllerOriginalImage];
    UIImage *imageToDisplay = [self fixOrientation:sourceImage];

    [self performSelectorInBackground:@selector(detectWithImage:) withObject:[imageToDisplay retain]];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    if ([self.talk.text isEqualToString:@""]) {
        self.startImageView.hidden = NO;
        self.myTitle.hidden = NO;
        self.wood1.hidden = NO;
        self.wood2.hidden = NO;
        self.startButton.hidden = NO;
        self.instructionButton.hidden = NO;
        self.repickButton.hidden = YES;
        self.shareButton.hidden = YES;
        self.myFrame.hidden = YES;
    }
}
-(void) dealloc {
    [imagePicker release];
    [_talk release];
    [_Sanguo release];
    [_Original release];
    [_startButton release];
    [_wood1 release];
    [_wood2 release];
    [_myTitle release];
    [_scrollView release];
    [_repickButton release];
    [_myFrame release];
    [_scrollButton release];
    [_shareButton release];
    [_instructionButton release];
    [_instructionImage release];
    [super dealloc];
}
@end
