<?php
namespace Api\Model;   
use Think\Model;
class SmsModel extends Model{
    //构造虚拟模型 3.2.3+需要
    Protected $autoCheckFields = false;
    public function sendcode($mobile,$content){  
        //$content = "您好，您的验证码是{$code}打死不要告诉其他人【天鹅城】";
        $url='http://utf8.sms.webchinese.cn/'; 
        $rparams['Uid']='tianchenxue';
        $rparams['Key']='608c3096b11003826580';
        $rparams['smsMob']=$mobile;
        $rparams['smsText']=$content;
        $this->file_get_request($url,$rparams);
    }
    private function file_get_request($url,$postFields)
    {
        $post='';
        while (list($k,$v) = each($postFields)) 
        {
            $post .= rawurlencode($k)."=".rawurlencode($v)."&"; //×ªURL±ê×¼Âë
        }
        return file_get_contents($url.'?'.$post);
    }
    
}

?>