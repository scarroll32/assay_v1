class CosmicsController < ApplicationController
 
 # def index
#    @search = Cosmic.search(params[:q])
#    @cosmics = @search.result.paginate(:page => params[:page])
#    @search.build_condition
#  end

# def select
#    Cosmic.update_all({selected: true}, {cosmic_mut_id: params[:cosmic_mut_ids]})
#    @batch = Batch.create!(:status => 'selected',:status_timestamp => Time.now, 
#                                                 :user_id => current_user.id, 
#                                                 :primer3_setting_id => 2,
#                                                 :step => 'selection', :status => 'completed')
#    @batch.description =  "Batch: #{@batch.id}"
#    @batch.save
 #   #debugger
#    params[:cosmic_mut_ids].each do |cosmic_mut_id|
#      @batch_detail = BatchDetail.create!(:batch_id => @batch.id, :cosmic_mut_id => cosmic_mut_id, 
#                                          :step => 'lookup', :status => 'ready')
#      @batch_detail.save
#    end
#    session[:step] = :lookup
#    session[:batch_num] = @batch.id
#    Resque.enqueue(UcscQuery,@batch.id)
#    redirect_to @batch
#  end
end
