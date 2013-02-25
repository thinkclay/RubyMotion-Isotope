class ItemCell < UICollectionViewCell
  
  def display_string=(string)
    @display_label.text = string unless @display_label.text == string      
  end
  
  def initWithFrame(frame)
    super.tap do
      @display_label = UILabel.alloc.initWithFrame(self.contentView.bounds).tap do |label|
         label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
         label.backgroundColor = [UIColor.darkGrayColor, UIColor.brownColor, UIColor.grayColor].sample
         label.textColor = UIColor.whiteColor
         label.textAlignment = NSTextAlignmentCenter
         self.contentView.addSubview(label)
       end
     end
  end
end