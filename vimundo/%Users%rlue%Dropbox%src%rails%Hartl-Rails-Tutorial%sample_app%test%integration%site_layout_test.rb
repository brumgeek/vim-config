Vim�UnDo� D3�e=#�\q:姑��J��@Ѓ�[D��V��      5    assert_select "title", "Sign Up | #{@base_title}"                             V��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             V�
�     �      	           # �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V�
�     �      	   	        # 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V�
�     �         	        #5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             V�
�     �         	        5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             V�
�     �      
   	       5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             V�
�     �                   �      
   
    5�_�                       1    ����                                                                                                                                                                                                                                                                                                                                                             V�	     �             �             5�_�      	                 (    ����                                                                                                                                                                                                                                                                                                                                                             V�     �               2    assert_select "a[href=?]", root_path, count: 25�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             V�     �               (    assert_select "a[href=?]", root_path5�_�   	              
      "    ����                                                                                                                                                                                                                                                                                                                                                             V�     �             �             5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             V�     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V�     �               (    assert_select "a[href=?]", help_path5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V�    �               (    assert_select "a[href=?]", help_path5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V��     �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             V��     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V��     �                 test "layout links" do5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V��     �                   get root_path5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             V��     �             �             5�_�                          ����                                                                                                                                                                                                                                                                                                                                                             V��     �                  test "should get new" do       get :new       assert_response :success   5    assert_select "title", "Sign Up | #{@base_title}"     end5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V��     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V��     �         "        test "should get new" do5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V��     �                    test "should get new" do5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V��     �                    get :new5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V�     �                '    assert_template 'static_pages/home'5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V�    �                2    assert_select "a[href=?]", root_path, count: 2   (    assert_select "a[href=?]", help_path   )    assert_select "a[href=?]", about_path   +    assert_select "a[href=?]", contact_path     end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             V�V    �                    assert_response :success5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             V��     �                  def setup   5    @base_title = "Ruby on Rails Tutorial Sample App"     end    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             V��    �               5    assert_select "title", "Sign Up | #{@base_title}"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             V��     �              5��