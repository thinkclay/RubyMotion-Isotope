class ViewController < UICollectionViewController
  CELL_IDENTIFIER = "Isotope cell"
  CELL_WIDTH = 160
  CELL_COUNT = 50
  
  def initWithCollectionViewLayout(layout = Isotope.alloc.init)
    super
  end
  
  def viewDidLoad
    @prng = Random.new
    self.collectionView.registerClass(ItemCell, forCellWithReuseIdentifier:CELL_IDENTIFIER)
    
    self.collectionView.collectionViewLayout.tap do |layout|
      layout.item_width = CELL_WIDTH
      layout.column_count = self.collectionView.bounds.size.width / CELL_WIDTH
      layout.section_inset = UIEdgeInsets.new(2, 5, 2, 5)
      layout.delegate = self
    end

    self.collectionView.backgroundColor = UIColor.scrollViewTexturedBackgroundColor
  end
    
  def collectionView(view, numberOfItemsInSection:section)
    CELL_COUNT
  end
    
  def collectionView(clv, cellForItemAtIndexPath:index_path)
    clv.dequeueReusableCellWithReuseIdentifier(CELL_IDENTIFIER, forIndexPath:index_path).tap do |cell|
      cell.display_string = "#{index_path.row}"  
    end
  end
  
  def numberOfSectionsInCollectionView(clv)
    1
  end
  
  def collectionView(clv, layout:layout, heightForItemAtIndexPath:path)
    # images[path.item].size.height this could be done here with images
    @prng.rand(50..200)
  end
  
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscape
  end
  
  def didRotateFromInterfaceOrientation(orientation)
    self.collectionView.collectionViewLayout.tap do |layout|
      layout.column_count = self.collectionView.bounds.size.width / CELL_WIDTH
      width = orientation == UIDeviceOrientationLandscapeRight || 
              orientation == UIDeviceOrientationLandscapeLeft ? 153 : CELL_WIDTH
      layout.item_width = width 
    end
  end
end