<?php
/**
 * Created by PhpStorm.
 * User: jiaruo
 * Date: 17/2/16
 * Time: 上午10:56
 */

namespace Api\Controller;


class FarmsController extends CommonController
{
    protected $userId = null;
    protected $animalPrice = null; //富贵鸡价格
    protected $feedProce = null;//私聊价格
    protected $actricePrice = null;//激活码价格
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        $this->animalPrice = C('animalPrice');
        $this->feedProce = C('feedProce');
        $this->actricePrice = C('actricePrice');

        if(IS_POST){
            $this->checkGet(array('token'));
            $this->userId = $this->tokenToUserId(I('post.token'));
        }
    }

    /**
     * 获得商品
     */
    public function getProducts()
    {
        $products = array(
            'animalPrice' => $this->animalPrice,
            'feedProce' => $this->feedProce,
            'actricePrice' => $this->actricePrice,
        );
        $this->echoJson($products);
    }

    /**
     * 购买牲畜
     */
   /* public function buyAnimal()
    {
        if(IS_POST){
            $time = strtotime(date('Y-m-d',time()).' 00:00:00');

            $buyNumber = M('user_animal')->where(array('userid'=>$this->userId,'create_time'=>$time))->count();

            if($buyNumber >= C('buyCycleMostNumber')){//判断今天是否购买
                $this->echoJson(-12);
            }

            $user = $this->getUser($this->userId);
            if($user['currency'] < $this->animalPrice){//货币是否足够
                $this->echoJson(-11);
            }
			
			$buyNumber = M('user_animal')->where(array('userid'=>$this->userId))->count();

			
            $resutl = M('member')->where(array('id'=>$this->userId))->setDec('currency',$this->animalPrice);
            if($this->isFalse($resutl)){
                $this->echoJson(-1);
            }
            $animalNo = $user['account'].$buyNumber + 1;
            $lifeCycle = C('lifeCycle');//生命周期
            $expiredTime = time() + $lifeCycle * 86400;
            $animalResult = M('user_animal')->add(array(
                'userid'    => $this->userId,
                'animal_on' => $animalNo,
                'create_time'   => $time,
                'expired_time'  => $expiredTime
            ));
            if($animalResult){
                addLog($this->userId,'购买天鹅',1,$this->animalPrice);
                echo json_encode(array('errcode'=>10000,'msg'=>'购买天鹅成功！'));exit;
            }
        }
        $this->echoJson(-1);
    }*/

    
 
	public function getPrice(){
		$market_price = M('market_price')->where(array('start'=>array('elt',date('Y-m-d'))))->order('start desc')->find();
		$this->echoJson($market_price);
		
	}
    //开池
    public function openFarm(){
        $this->checkGet(array('type'));
        $type=I('post.type');//1 绿池 2黄池 
        $animal=$type==1?C('green_farm'):C('gold_farm');
        $time = strtotime(date('Y-m-d',time()).' 00:00:00');
        if(!$animal){
             $this->echoJson('获取池数量异常');
        }

        $user = $this->getUser($this->userId);
       
        if($user['animal_num'] < $animal){//货币是否足够

            $this->echoJson('开池所需天鹅不足。');
        }
        
        if($type==1){ 
            $count= M('user_farm')->where(array('userid'=>$this->userId,'type'=>1))->count();
            if($count >= 10  ){
                $this->echoJson('农场绿池已满');
            }
        }else{ 
            $count= M('user_farm')->where(array('userid'=>$this->userId,'type'=>2))->count();
            if($count>= 5){
                $this->echoJson('农场金池已满');
            }

        }
        $resutl = M('member')->where(array('id'=>$this->userId))->setDec('animal_num',$animal);
 

        if($this->isFalse($resutl)){
            $this->echoJson(-1);
        }
        $farmResult = M('user_farm')->add(array(
                'userid'    => $this->userId,
                'type' => $type,
                'create_time'   => $time,
                'num'=>$animal,
                'egg_status'=>2
                
            ));
        if($farmResult){
            addLog($this->userId,'开'.($type==1?'绿':'金').'池'."花费动物{$animal}只",4,$animal);
            echo json_encode(array('errcode'=>10000,'msg'=>'开池成功！'));exit;
        }

 
        $this->echoJson(-1);
    }
    //土池孵化鸡蛋
    public function hatchEgg(){
        if(IS_POST){ 
            $this->checkGet(array('id','egg_num'));
            $data = I('post.'); 
            $farm= M('user_farm')->field('id,add_num,num,type')->where(array('id'=>$data['id']))->find();
            if(!$farm){
                 $this->echoJson('请指定孵化土池！');
            }
            //  $data['egg_num']=(int)$data['egg_num'];
            if(!is_int($data['egg_num']+0)){
                $this->echoJson('孵化数量必须是整数');
            }
            if($data['egg_num']<1){
                $this->echoJson('孵化数量必须大于1');
            }
            if($farm['type']==1){
                if($farm['add_num']+$farm['num']+$data['egg_num']>3000){
                     $this->echoJson('绿池动物总量不能超过3000');
                }
            }else{
                if($farm['add_num']+$farm['num']+$data['egg_num']>30000){
                     $this->echoJson('金池动物总量不能超过30000');
                }
            }
            $user= M('member')->field('currency')->where(array('id'=>$this->userId))->find();
            if($user['currency'] < $data['egg_num']){
                $this->echoJson('-19');
            }

            $r1= M('member')->where(array('id'=>$this->userId))->setDec('currency',$data['egg_num']);
            if($this->isFalse($r1)){
                $this->echoJson(-1);
            }
            $r2=M('user_farm')->where(array('id'=>$data['id']))->setInc('add_num',$data['egg_num']);
            if($this->isFalse($r2)){
                $this->echoJson(-1);
            }

            $log['userid']=$this->userId;
            $log['create_time']=time();
            $log['farm_type']=$farm['type'];
            $log['number']=$data['egg_num'];
            $log['farm_id']=$data['id'];
            $log['type']=2;
            M('farm_log')->add($log);
           /* $r2=M('member')->where(array('id'=>$this->userId))->setInc('animal_num',$data['egg_num']); 
            if($this->isFalse($r2)){
                $this->echoJson(-1);
            }*/
           addLog($this->userId,"孵化蛋蛋{$data['egg_num']}个",5, $data['egg_num']);
           echo json_encode(array('errcode'=>10000,'msg'=>'孵化成功！'));exit;
        
        }

        $this->echoJson(-1);
    }
    //增养动物
    public function addanimal(){
        if(IS_POST){ 
            $this->checkGet(array('id','animal_num'));
            $data = I('post.'); 
            $farm= M('user_farm')->field('id,type,num,add_num')->where(array('id'=>$data['id'],'userid'=>$this->userId))->find();
            if(!$farm){
                $this->echoJson(-28);
            }
            if(!is_int($data['animal_num']+0)){
                $this->echoJson('增养数量必须是整数');
            }
            if($farm['type']==1){
                if($farm['add_num']+$farm['num']+$data['animal_num']>3000){
                     $this->echoJson('绿池动物总量不能超过3000');
                }
            }else{
                if($farm['add_num']+$farm['num']+$data['animal_num']>30000){
                     $this->echoJson('金池动物总量不能超过30000');
                }
            }
            $user= M('member')->field('animal_num')->where(array('id'=>$this->userId))->find();
            if($user['animal_num'] < $data['animal_num']){
                $this->echoJson('-27');
            } 
            $r1= M('member')->where(array('id'=>$this->userId))->setDec('animal_num',$data['animal_num']);
            if($this->isFalse($r1)){
                $this->echoJson(-1);
            }
            $r2=M('user_farm')->where(array('id'=>$data['id']))->setInc('add_num',$data['animal_num']); 
            if($this->isFalse($r2)){
                $this->echoJson(-1);
            }
            $log['userid']=$this->userId;
            $log['create_time']=time();
            $log['farm_type']=$farm['type'];
            $log['number']=$data['animal_num'];
            $log['farm_id']=$data['id'];
            $log['type']=1;
            M('farm_log')->add($log);
            addLog($this->userId,"增养动物{$data['animal_num']}个",6, $data['animal_num']);
            echo json_encode(array('errcode'=>10000,'msg'=>'增养小鸡成功！'));exit;
        }

        $this->echoJson(-1);
    }
    //收取指定土池的小鸡跟鸡蛋。。
    public function getfarmsanimal(){
        if(IS_POST){
            $this->checkGet(array('id','type'));
            $data = I('post.'); 
            $farm= M('user_farm')->field('add_num,egg_rate,egg_status,egg_allrate')->where(array('id'=>$data['id'],'userid'=>$this->userId))->find();
            if(!$farm){
                $this->echoJson(-28);
            }
            if($farm['add_num']>0 && $data['type']==1){
                $r1=M('member')->where(array('id'=>$this->userId))->setInc('animal_num',$farm['add_num']);
                $r2=M('user_farm')->where(array('id'=>$data['id']))->setField('add_num',0);
                 
                if($this->isFalse($r1) || $this->isFalse($r2)){
                    $this->echoJson(-1);
                }
                addLog($this->userId,"收取小鸡{$farm['add_num']}个",7, $farm['add_num']);
            }
            if($farm['egg_rate']<=0 && $data['type']==2){
                M('user_farm')->where(array('id'=>$data['id']))->setField('egg_status',2);
            }
            if($farm['egg_rate']>0 && $farm['egg_status']==1 && $data['type']==2){
                $save['egg_status']=2;
                $save['egg_allrate']=$farm['egg_allrate']+$farm['egg_rate'];
                $r2=M('user_farm')->where(array('id'=>$data['id']))->save($save); 
                $r1=M('member')->where(array('id'=>$this->userId))->setInc('currency',$farm['egg_rate']);
                if($this->isFalse($r1) || $this->isFalse($r2)){
                    $this->echoJson(-1);
                }
                addLog($this->userId,"收取蛋蛋{$farm['egg_rate']}个",8, $farm['egg_rate']);

                //处理上级收入
                $mine =M('member')->where(array('id'=>$this->userId))->find();
                if($mine['references']){
                    $shag=M('member')->where(array('account'=>$mine['references']))->find();
                    $path = 'App/Common/Conf/system.php';
                    $file = include $path;
                    $lilvone =$this->getlilv($shag['account'],$file['onedai']);
                    $one = bcdiv($lilvone,100,6);
                    $number =bcmul($farm['egg_rate'],$one,2);
                    $inserdata['userid'] = $shag['id'];
                    $inserdata['desc'] ="一级推荐奖";
                    $inserdata['create_time'] =time();
                    $inserdata['type'] =51;
                    $inserdata['number'] =$number;
                    $inserdata['state'] =1;
                    $inserdata['username'] =$this->userId;
                    if($number && $shag['account']){
                        M("user_finance")->add($inserdata);
                        $currencyone = bcadd($shag['currency'],$number,2);
                        M('member')->where(array('account'=>$mine['references']))->save(array('currency'=>$currencyone));

                        //处理二级
                        $shangtwo =M('member')->where(array('account'=>$shag['references']))->find();
                        $lilvtwo =$this->getlilv($shangtwo['account'],$file['twodai']);
                        $two = bcdiv($lilvtwo,100,6);
                        $numbertwo =bcmul($farm['egg_rate'],$two,2);
                        $inserdata['userid'] = $lilvtwo['id'];
                        $inserdata['desc'] ="二级推荐奖";
                        $inserdata['create_time'] =time();
                        $inserdata['type'] =51;
                        $inserdata['number'] =$numbertwo;
                        $inserdata['state'] =1;
                        $inserdata['username'] =$this->userId;
                        if($numbertwo){
                            $currencytwo = bcadd($shangtwo['currency'],$numbertwo,2);
                            M('member')->where(array('account'=>$shag['references']))->save(array('currency'=>$currencytwo));
                        }
                    }
                }
            } 
            echo json_encode(array('errcode'=>10000,'msg'=>'打扫成功！','currency'=>$farm['egg_rate'],'aninal_num'=>$farm['add_num']));exit;
             
        }

        $this->echoJson(-1);


    }

    /**
     * @param $account
     * @param $lilv
     * @return string
     * 根据账户  获取当前的利率
     */
    public function getlilv($account,$lilv){
        $numbers = M('member')->where(array('account'=>$account))->count();
        if($numbers >= 500){
            $lilv =bcadd($lilv,0.5);
        }elseif ($numbers >= 200){
            $lilv =bcadd($lilv,0.4);
        }elseif ($numbers >= 80){
            $lilv =bcadd($lilv,0.3);
        }elseif ($numbers >= 30){
            $lilv =bcadd($lilv,0.2);
        }elseif ($numbers >= 10){
            $lilv =bcadd($lilv,0.1);
        }
        return $lilv;
    }

}