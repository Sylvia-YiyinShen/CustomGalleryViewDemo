# A customisable gallery widget

1. custom cell
2. custom size
3. custom background

# How to use
1. make your own collection view cell conform to GalleryViewCellProtocol
2. make your own cell model conform to GalleryViewCellModelProtocol
3. invoke GalleryView's func configure(models: [GalleryViewCellModelProtocol], customCellNib: UINib, backgroundColor: UIColor = default)

